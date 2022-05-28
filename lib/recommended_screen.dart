import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/models/models.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/components/constants.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
class UtilsRecommended{
  static List <RecommendedPlaces> getRecommendedPlaces(){
    return [
      RecommendedPlaces(
          placeName: 'They Pyramids',
          imagePath: 'assets/images/Pyramids.jpg',
          distance: '26 Km',
          rating: '4.8'
      ),
      RecommendedPlaces(
          placeName: 'They Pyramids',
          imagePath: 'assets/images/Pyramids.jpg',
          distance: '26 Km',
          rating: '4.8'
      ),
      RecommendedPlaces(
          placeName: 'They Pyramids',
          imagePath: 'assets/images/Pyramids.jpg',
          distance: '26 Km',
          rating: '4.8'
      ),
      RecommendedPlaces(
          placeName: 'They Pyramids',
          imagePath: 'assets/images/Pyramids.jpg',
          distance: '26 Km',
          rating: '4.8'
      ),
      RecommendedPlaces(
          placeName: 'They Pyramids',
          imagePath: 'assets/images/Pyramids.jpg',
          distance: '26 Km',
          rating: '4.8'
      ),
      RecommendedPlaces(
          placeName: 'They Pyramids',
          imagePath: 'assets/images/Pyramids.jpg',
          distance: '26 Km',
          rating: '4.8'
      ),
    ];
  }
}

class RecommendedScreen extends StatelessWidget{
  const RecommendedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    List<RecommendedPlaces> recommendedPlaces = UtilsRecommended.getRecommendedPlaces();

    PageController recommendedPageController =PageController(initialPage: 0);


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
                      return Text('lodaing');
                    }
                    final data = snapshot.requireData;
                    return Container(
                      width: mediaQueryWidth,
                      height: mediaQueryHeight,
                      child: ListView.builder(
                        itemCount: data.size,
                          itemBuilder:(context, index) {
                            return defualtCard1(
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

