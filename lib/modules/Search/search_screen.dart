import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../utils.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText = "";

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: tGrey(),
                    ),
                    borderRadius:
                        BorderRadius.circular(mediaQueryWidth * 0.125),
                  ),
                  height: mediaQueryHeight * 0.08,
                  width: double.infinity,
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        inputText = val;
                        print(inputText);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: tGrey()),
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  )),
              Expanded(
                child: Container(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("All")
                          .where("name", isGreaterThanOrEqualTo: inputText)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Something went wrong"),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Container(
                              child: Card(
                                elevation: 5,
                                child: ListTile(
                                    title: Text(data['name']),
                                    leading: Image.network(data['image']),
                                    onTap: () {
                                      showDialog(context: context, builder: (_)=> Dialog(
                                          child: SingleChildScrollView(
                                            child:
                                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                              Stack(
                                                children: [
                                                  SizedBox(
                                                    width: mediaQueryWidth,
                                                    height: mediaQueryHeight*0.227,
                                                    child:ClipRRect(
                                                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)
                                                        ),
                                                        child: Image(image: NetworkImage(data['image']),
                                                          fit: BoxFit.fill,)),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375, vertical: mediaQueryHeight*0.01311),
                                                    child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: tPrimary(),
                                                      child: IconButton(onPressed: () {
                                                        Navigator.pop(context);
                                                      }, icon: const Icon(Icons.close,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(data['name'],
                                                      style: const TextStyle(fontSize: 33),),
                                                    SizedBox(height: mediaQueryHeight*0.019,),
                                                    aboutDetails(details: data['description']),
                                                    SizedBox(
                                                      height: mediaQueryHeight*0.019,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Utils.openLink(url:data['location']);

                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                        child: Container(
                                                          width: mediaQueryWidth*1.25,
                                                          height: mediaQueryHeight*0.143,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(30),
                                                            image: const DecorationImage(
                                                              fit: BoxFit.fitWidth,
                                                              image: AssetImage('assets/images/Map.jpeg'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: mediaQueryHeight*0.019,
                                                    ),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                              width: mediaQueryWidth*0.156,
                                                              height: mediaQueryHeight*0.081,
                                                              child: ElevatedButton(
                                                                onPressed: () {
                                                                  addToFavorites(
                                                                      number: data['number'],
                                                                      name: data['name'],
                                                                      image: data['image'],
                                                                      location: data['location'],
                                                                      distance: '${data['distance']}',
                                                                      description: data['description'],
                                                                      latitude: '${data['latitude']}',
                                                                      longitude: '${data['longitude']}');
                                                                },
                                                                child: Icon(Icons.favorite ,
                                                                  size: mediaQueryWidth*0.0625,
                                                                  color: Colors.white,
                                                                ),
                                                                style: ElevatedButton.styleFrom(
                                                                  primary: const Color(0xff292D32),
                                                                  shape: const CircleBorder(),
                                                                ),
                                                              )),
                                                          SizedBox(

                                                              width: mediaQueryWidth*0.500,
                                                              height: mediaQueryHeight*0.081,

                                                              child: ElevatedButton(
                                                                onPressed: () {
                                                                  addToTour(
                                                                      number: data['number'],
                                                                      name: data['name'],
                                                                      image: data['image'],
                                                                      location: data['location'],
                                                                      distance: '${data['distance']}',
                                                                      description: data['description'],
                                                                      latitude: '${data['latitude']}',
                                                                      longitude: '${data['longitude']}');

                                                                },
                                                                child: Text.rich(TextSpan(
                                                                  text: 'Add to Tour',
                                                                  style: TextStyle(
                                                                      color: Colors.white, fontSize: mediaQueryWidth*0.0625),
                                                                )),
                                                                style: ElevatedButton.styleFrom(
                                                                    shape: const StadiumBorder(),
                                                                    primary: const Color(0xff292D32)
                                                                ),
                                                              )
                                                          ),
                                                        ]),
                                                    SizedBox(height: mediaQueryHeight*0.019,),
                                                  ],
                                                ),
                                              )

                                            ],),
                                          )
                                      ));
                                    }),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
