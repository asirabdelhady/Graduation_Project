import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/components/components.dart';

class CategoryScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.start ,
                  children: [
                    backButton(),
                    detailsTitle(title: 'Categories'),
                  ],
                ),
                SizedBox(height: mediaQueryHeight*0.049,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitle(subTitle: 'Tourist Attractions'),
                    Icon(Icons.keyboard_arrow_right),
                  ],),
                cardBuilderWithDotIndicator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitle(subTitle: 'Hotels'),
                    Icon(Icons.keyboard_arrow_right),
                  ],),
                cardBuilderWithDotIndicator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitle(subTitle: 'Entertainment'),
                    Icon(Icons.keyboard_arrow_right),
                  ],),
                cardBuilderWithDotIndicator(),
                SizedBox(height: 30,)


              ],
            ),
          ),
        ),
      ),
    );
  }
}


