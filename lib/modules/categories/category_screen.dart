import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/models/models.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

import '../../shared/components/constants.dart';

class CategoryScreen extends StatefulWidget{

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  get tAttractions => null;

  @override
  void initState() {
   Firebase.initializeApp().whenComplete(() {
     print("completed");
     setState(() {});
   });
   getAllEntertainment(context).then((value) => setState((){}));
   getAllHotels(context).then((value) => setState((){}));
   getAllAttractions(context).then((value) => setState((){}));
   super.initState();


  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    PageController recommendedPageController =PageController(initialPage: 0);
    PageController attractionsPageController =PageController(initialPage: 0);
    PageController hotelsPageController =PageController(initialPage: 0);
    PageController entertainmentPageController =PageController(initialPage: 0);
    PageController scrollController = PageController();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.start ,
                  children: [
                    backButton(),
                    defaultTitle(title: 'Categories'),
                  ],
                ),
                Container(
                  height: mediaQueryHeight*0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mediaQueryWidth*0.0625),
                    border: Border.all(
                      color: tGrey(),
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                ),
                SizedBox(height: mediaQueryHeight*0.039,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subTitle(subTitle: 'Recommended (nearby)'),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                    /*SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          height: mediaQueryHeight*0.322,
                          width: mediaQueryWidth,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => defualtCard(
                                placeName:recommendedPlaces[index].placeName,
                                imagePath: recommendedPlaces[index].imagePath,
                                rating: recommendedPlaces[index].rating,
                                distance: recommendedPlaces[index].distance),
                            itemCount: recommendedPlaces.length,
                            controller: recommendedPageController,
                          )
                      ),
                    ),*/
                    /*Center(
                      child: SmoothPageIndicator(
                        controller: recommendedPageController,
                        count: recommendedPlaces.length,
                        effect: ScrollingDotsEffect(
                          dotColor: tGrey(),
                          activeDotColor: tPrimary(),
                        ),
                      ),
                    ),*/
                    SizedBox(height: mediaQueryHeight*0.049,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subTitle(subTitle: 'Tourist Attractions'),
                        Icon(Icons.keyboard_arrow_right),
                      ],),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          height: mediaQueryHeight*0.322,
                          width: mediaQueryWidth,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => defualtCard(attractions[index]),
                            itemCount: attractions.length,
                            controller: attractionsPageController,
                          )
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: attractionsPageController,
                        count: attractions.length,
                        effect: ScrollingDotsEffect(
                          dotColor: tGrey(),
                          activeDotColor: tPrimary(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subTitle(subTitle: 'Hotels'),
                        Icon(Icons.keyboard_arrow_right),
                      ],),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          height: mediaQueryHeight*0.322,
                          width: mediaQueryWidth,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => defualtCard(hotels[index]),
                            itemCount: hotels.length,
                            controller: hotelsPageController,
                          )
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: hotelsPageController,
                        count: hotels.length,
                        effect: ScrollingDotsEffect(
                          dotColor: tGrey(),
                          activeDotColor: tPrimary(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subTitle(subTitle: 'Entertainment'),
                        Icon(Icons.keyboard_arrow_right),
                      ],),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          height: mediaQueryHeight*0.322,
                          width: mediaQueryWidth,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => defualtCard(entertainment[index]),
                            itemCount: entertainment.length,
                            controller: entertainmentPageController,
                          )
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: entertainmentPageController,
                        count: attractions.length,
                        effect: ScrollingDotsEffect(
                          dotColor: tGrey(),
                          activeDotColor: tPrimary(),
                        ),
                      ),
                    ),
                    SizedBox(height: mediaQueryHeight*0.049,),
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

