import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/models/models.dart';
import 'package:tour_guide_app/modules/categories/category_screen.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';
import 'package:tour_guide_app/recommended_screen.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

import '../tour/tour_screen.dart';
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
    ];
  }
}
class UtilsCategories{
  static List <Categories> getCategories(){
    return [
      Categories(
        categoryName: 'Tourist Attractoins',
        imagePath:'assets/images/Pic3.png',
        numberOfPlaces: '10 active places',
      ),
      Categories(
        categoryName: 'Hotels',
        imagePath:'assets/images/Pic3.png',
        numberOfPlaces: '10 active places',
      ),
      Categories(
        categoryName: 'Entertainment',
        imagePath:'assets/images/Pic3.png',
        numberOfPlaces: '10 active places',
      ),
    ];
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<RecommendedPlaces> recommendedPlaces = UtilsRecommended.getRecommendedPlaces();
  List<Categories> categories = UtilsCategories.getCategories();
//////////////
  int activeStep = 5; // Initial step set to 5.

  int upperBound = 6; // upperBound MUST BE total number of icons minus 1.
  ///////////////
  @override
  Widget build(BuildContext context) {

    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    PageController categoriesPageController = PageController(initialPage: 0);
    PageController recommendedPageController = PageController(initialPage: 0);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mediaQueryWidth*0.025),
                      child: Container(
                        width: mediaQueryWidth*0.125,
                        height: mediaQueryHeight*0.0655,
                        decoration: BoxDecoration(
                          color: tPrimary(),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(Icons.my_location_outlined, color: Colors.white,),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Container(
                        width: mediaQueryWidth*0.25,
                        child: Text(
                          'El-Haram jjjjjjjjjjjjjjjjj',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: tPrimary(),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        width: mediaQueryWidth*0.5,
                        child: Text(
                          '12, Khater street',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: tPrimary(),
                          ),
                        ),
                      )
                    ],)
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: tGrey(),
                            ),
                            borderRadius: BorderRadius.circular(mediaQueryWidth*0.125),
                          ),
                          height: mediaQueryHeight*0.06,
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: tGrey()),
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          )),
                    ),
                  ],
                ), //search
                SizedBox(height:mediaQueryHeight*0.016,),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return TourScreen();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(mediaQueryWidth*0.125),
                          ),
                          height: mediaQueryHeight*0.2459,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(mediaQueryWidth*0.025, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                ///////////////////////////////////

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.only(start: 10.0,top: 8),
                                        child: Text('My Tour',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ),
                                      IconStepper(
                                        icons: [
                                          Icon(null),
                                          Icon(null),
                                          Icon(null),
                                          Icon(null),
                                          Icon(null),
                                          Icon(null),
                                          Icon(null),
                                        ],

                                        // activeStep property set to activeStep variable defined above.
                                        activeStep: activeStep,
                                        enableStepTapping: false,
                                        //enableNextPreviousButtons: false,
                                        stepColor: tGrey(),
                                        activeStepBorderColor:tPrimary(),
                                        activeStepBorderWidth:5,
                                        activeStepBorderPadding: 0,
                                        activeStepColor: tSecondary(),
                                        lineColor: tPrimary(),
                                        stepRadius: 14,


                                        // This ensures step-tapping updates the activeStep.
                                        onStepReached: (index) {
                                          setState(() {
                                            activeStep = index;
                                          });
                                        },
                                      ),
                                      SizedBox(height: 12,),

                                      Expanded(
                                        child: Text('Next stop, The Pryamids',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8,right: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                            nextButton(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )

                                //////////////////////////////////



                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ), //tourTracking
                SizedBox(height:mediaQueryHeight* 0.016,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitle(subTitle: 'Recommended (nearby)'),
                    Container(
                      height: mediaQueryHeight*0.049,
                      width: mediaQueryWidth*0.1875,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return RecommendedScreen();
                        }));
                      },
                          style: ElevatedButton.styleFrom(
                            primary: tPrimary(),
                            shape: StadiumBorder(),
                          ),
                          child: Text('All')),
                    ),

                  ],
                ),
                SizedBox(height: mediaQueryHeight*0.039,),
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
                Center(
                  child: SmoothPageIndicator(
                    controller: recommendedPageController,
                    count: recommendedPlaces.length,
                    effect: WormEffect(
                      dotColor: tGrey(),
                      activeDotColor: tPrimary(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitle(subTitle: 'Categories'),
                    Container(
                      height: mediaQueryHeight*0.049,
                      width: mediaQueryWidth*0.1875,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return CategoryScreen();
                        }));
                      },
                          style: ElevatedButton.styleFrom(
                            primary: tPrimary(),
                            shape: StadiumBorder(),
                          ),
                          child: Text('All')),
                    ),

                  ],
                ),
                SizedBox(height: mediaQueryHeight*0.016,),
                /*SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      height: mediaQueryHeight*0.322,
                      width: mediaQueryWidth,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => categoryCard(
                            categoryName: categories[index].categoryName,
                            imagePath: categories[index].imagePath,
                            numberOfPlaces: categories[index].numberOfPlaces),
                        itemCount: categories.length,
                        controller: categoriesPageController,
                      )
                  ),
                ),*/
                Center(
                  child: SmoothPageIndicator(
                    controller: categoriesPageController,
                    count: categories.length,
                    effect: WormEffect(
                      dotColor: tGrey(),
                      activeDotColor: tPrimary(),
                    ),
                  ),
                ),
                SizedBox(height: mediaQueryHeight*0.098,),

              ],),
          ),
        ),
      ),
    );

    }
  // Returns the next button
  Widget nextButton() {
    return ElevatedButton(onPressed: (){
      // Increment activeStep, when the next button is tapped. However, check for upper bound.
      if (activeStep < upperBound) {
        setState(() {
          activeStep++;

        });
      }

    },
        style: ElevatedButton.styleFrom(
          primary: tPrimary(),
          shape: StadiumBorder(),
        ),
        child: Text('Next'));
  }


}

