import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/components/components.dart';

class RecommendedScreen extends StatelessWidget{
  const RecommendedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    final Stream<QuerySnapshot> attractions = FirebaseFirestore.instance.collection('tAttraction').snapshots();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: attractions ,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError){
                      return Text('somthing went wrong');
                    }
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                    final data = snapshot.requireData;
                    return Container(
                      width: mediaQueryWidth,
                      height: mediaQueryHeight,
                      child: ListView.builder(
                        itemCount: data.size,
                          itemBuilder:(context, index) {
                            return defualtCard1(
                              number: data.docs[index]["number"],
                                name: data.docs[index]["name"],
                                image: data.docs[index]["image"],
                                rating: data.docs[index]["rating"],
                                distance: data.docs[index]["distance"],
                                location: data.docs[index]["location"],
                                description: data.docs[index]["description"],
                                latitude: data.docs[index]["latitude"],
                                longitude: data.docs[index]["longitude"]) ;
                          }),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

