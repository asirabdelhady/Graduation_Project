import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/models/models.dart';
import 'package:tour_guide_app/shared/components/components.dart';
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


    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.start ,
                  children: [
                    backButton(),
                    defaultTitle(title: 'Nearby Places'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitle(subTitle: 'Recommended (nearby)'),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                SingleChildScrollView(
                  child: Container(
                      height: mediaQueryHeight,
                      width: mediaQueryWidth,
                      child: ListView.separated(
                        separatorBuilder:(context, index) => SizedBox(height: 0.0196,),
                        itemBuilder: (context, index) => defualtCard(
                            placeName:recommendedPlaces[index].placeName,
                            imagePath: recommendedPlaces[index].imagePath,
                            rating: recommendedPlaces[index].rating,
                            distance: recommendedPlaces[index].distance),
                        itemCount: recommendedPlaces.length,
                        controller: recommendedPageController,
                      )
                  ),
                ),
                SizedBox(height: mediaQueryHeight*0.049,)


              ],
            ),
          ),
        ),
      ),
    );
  }
}

