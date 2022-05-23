import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class Place {
  String name;
  String image;
  Place({required this.name,required this.image});
}

class TourScreen extends StatefulWidget{
  const TourScreen({Key? key}) : super(key: key);
  @override
  State<TourScreen> createState() => _TourScreenState();

}
class _TourScreenState extends State<TourScreen> {
  int index = 1;

  @override
  void initState() {
    getAllTour();
    super.initState();
  }
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text('Tour Plan',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: mediaQueryWidth * 0.093),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: tour.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap:(){
            showDialog(context: context,
              builder: (_)=> Dialog(
                  child: SingleChildScrollView(
                    child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Stack(
                        children: [
                          Container(
                            width: mediaQueryWidth,
                            height: mediaQueryHeight*0.227,
                            child:ClipRRect(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)
                                ),
                                child: Image(image: NetworkImage('${tour[index]['image']}'),
                                  fit: BoxFit.fill,)),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375, vertical: mediaQueryHeight*0.01311),
                            child: CircleAvatar(
                              radius: 22.5,
                              backgroundColor: tPrimary(),
                              child: IconButton(onPressed: () {
                                Navigator.pop(context);
                              }, icon: Icon(Icons.arrow_back,
                                color: Colors.white,
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
                            Text('${tour[index]['name']}',
                              style: TextStyle(fontSize: 33),),
                            SizedBox(height: mediaQueryHeight*0.019,),
                            aboutDetails(details: '${tour[index]['description']}'),
                            SizedBox(
                              height: mediaQueryHeight*0.019,
                            ),
                            GestureDetector(
                              onTap: () {
                                tour[index]['location'];
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Container(
                                  width: mediaQueryWidth*1.25,
                                  height: mediaQueryHeight*0.163,
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
                                  Container(

                                      width: mediaQueryWidth*0.550,
                                      height: mediaQueryHeight*0.081,

                                      child: ElevatedButton(
                                        onPressed: () {
                                          addToFavorites(
                                              name: '${tour[index]['name']}',
                                              image: '${tour[index]['image']}',
                                              location: '${tour[index]['googlemaplocation']}',
                                              distance: '${tour[index]['description']}',
                                              description: '${tour[index]['description']}',
                                              latitude: '${tour[index]['latitude']}',
                                              longitude: '${tour[index]['longitude']}');

                                        },
                                        child: Text.rich(TextSpan(
                                          text: 'Add to Favorites',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: mediaQueryWidth*0.0525),
                                        )),
                                        style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            primary: Color(0xff292D32)
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
              ),
            );
          } ,
          child: Stack(
            children: [
              Container(

                width: mediaQueryWidth*0.916,
                height: mediaQueryHeight*0.159,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mediaQueryWidth*0.083),
                  color: tSecondary(),
                  boxShadow: [
                    BoxShadow(
                      color: tGrey(),
                      offset: Offset(5, 5),
                      blurRadius: 3,

                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: mediaQueryHeight*0.037,left: mediaQueryWidth*0.027),
                    child: Container(
                      width: mediaQueryWidth*0.277,
                      height: mediaQueryHeight*0.132,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(mediaQueryWidth*0.083),
                        color: tGrey(),
                        image: DecorationImage(
                          image: NetworkImage('${tour[index]['image']}'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: mediaQueryHeight*0.186,
                        width: mediaQueryWidth*0.555,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: mediaQueryHeight*0.01311),
                          child: Column(
                            children: [
                              Container(
                                width: mediaQueryWidth*0.486,
                                height: mediaQueryHeight*0.066,
                                child: Text(
                                  '${tour[index]['name']}',
                                  maxLines: 2,
                                  style: TextStyle(fontSize: mediaQueryWidth*0.0625, color: tPrimary(),),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: mediaQueryWidth*0.286,),
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(top: mediaQueryHeight*0.01311, end: mediaQueryWidth*0.0468),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(mediaQueryWidth*0.083)
                                      ),
                                      width: mediaQueryWidth*0.222,
                                      height: mediaQueryHeight*0.053,
                                      child: MaterialButton(
                                        onPressed:  (){
                                          addToHistory(
                                              name: '${tour[index]['name']}',
                                              image: '${tour[index]['image']}',
                                              location: '${tour[index]['googlemaplocation']}',
                                              distance: '${tour[index]['description']}',
                                              description: '${tour[index]['description']}',
                                              latitude: '${tour[index]['latitude']}',
                                              longitude: '${tour[index]['longitude']}');
                                          tour.removeAt(index);

                                          setState(() {

                                          });
                                          tour.removeAt(index);

                                        },
                                        elevation: 10,
                                        color: tPrimary(),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(mediaQueryWidth*0.083))),
                                        child: Text(
                                          'Done',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:mediaQueryWidth*0.044 ,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}

/*
  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    setState(() {
      Place song = _items[oldIndex];

      _items.removeAt(oldIndex);
      _items.insert(newIndex, song);
    });
  }
  List<Widget> _getListItems() => tour
      .asMap()
      .map((i, item) => MapEntry(i, _buildTenableListTile(item, i)))
      .values
      .toList();

  Widget _buildTenableListTile(tour, int index) {
    return Dismissible(
      key: Key(tour[index]),
      onDismissed: (direction) {
        setState(() {
          tour.removeAt(index);
        });
      },
      background: Container(color: Colors.transparent,child: const Center(child: Text('Swipe left or right to delete')),),
      child: ListTile(
        key: ValueKey(tour[index]),
       subtitle: ListView.builder(
           itemBuilder: (context, index) => tourPlanCard(tour[index])),
        onTap: () {},
        minLeadingWidth: double.infinity,
      ),
    );
  }

}
*/
