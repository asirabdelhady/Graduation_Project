import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/models/models.dart';
import 'package:tour_guide_app/modules/categories/category_screen.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';
import 'package:tour_guide_app/recommended_screen.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/components/constants.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

import '../tour/tour_screen.dart';
import 'location_controller.dart';

class UtilsCategories{
  static List <Categories> getCategories(){
    return [
      Categories(
        categoryName: 'Tourist Attractions',
        imagePath: 'assets/images/Cairo Tower.jpg',
        places: '50 active places' ,
      ),
      Categories(
        categoryName: 'Hotels',
        imagePath: 'assets/images/hotels.jpg',
        places: '50 active places' ,
      ),
      Categories(
        categoryName: 'Entertainment',
        imagePath: 'assets/images/KhanElKhalili.jpg',
        places: '50 active places' ,
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

  List<Categories> categories = UtilsCategories.getCategories();
//////////////
  int activeStep = 5; // Initial step set to 5.

  int upperBound = 6; // upperBound MUST BE total number of icons minus 1.
  ///////////////

  @override
  void initState() {
    getAllAttractions().then((value) => setState(() {}));
    getAllTour();
    setState(() {

    });
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    PageController categoriesPageController = PageController(initialPage: 0);
    PageController recommendedPageController = PageController(initialPage: 0);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: mediaQueryHeight,
            width: mediaQueryWidth,
            color: Colors.red,

          ),
          SafeArea(
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
                          padding: const EdgeInsets.all(360*0.025),
                          child: Container(
                            width: 360*0.125,
                            height: 752*0.0655,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: IconButton( color: Colors.white,
                            icon: const Icon(Icons.my_location_outlined),
                            onPressed: () async {
                              Position position = await getGeoLocationPosition();
                              addDistanceToAttractions().then((value) => setState((){}));
                              addDistanceToHotels().then((value) => setState((){}));
                              addDistanceToEntertainment().then((value) => setState((){}));
                             //location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
                              GetAddressFromLatLong(position);
                              print('location gotten');
                              print ('forweather=$forweather');
                              setState(() {

                              });
                              },
                          ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 360*0.25,
                              child: Text(
                                '${manteka}',
                                // maxLines: 1,
                                // overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              width: 360*0.5,
                              child: Text(
                                '${bakyelenwan}',
                                  maxLines: 2,
                                 overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
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
                                  prefixIcon: const Icon(Icons.search),
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
                                return const TourScreen();
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
                                        children:  [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(start: 20.0,top: 8),
                                            child: Text('My Tour',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsetsDirectional.only(start:20.0, top: 8),
                                            child: Text('Next stop,',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(start:20.0, top: 8),
                                            child: (tour.isEmpty)?Text('Go Home...',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 27,
                                              ),
                                            ):Text('${tour[0]['name']}',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 27,
                                              ),),
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
                        /*Container(
                          height: mediaQueryHeight*0.049,
                          width: mediaQueryWidth*0.1875,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const RecommendedScreen();
                            }));
                          },
                              style: ElevatedButton.styleFrom(
                                primary: tPrimary(),
                                shape: const StadiumBorder(),
                              ),
                              child: const Text('All')),
                        ),*/

                      ],
                    ),
                    SizedBox(height: mediaQueryHeight*0.039,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          height: mediaQueryHeight*0.322,
                          width: mediaQueryWidth,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => defualtCard(attractions[index]),
                            itemCount: attractions.length,
                            controller: recommendedPageController,
                          )
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: recommendedPageController,
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
                                shape: const StadiumBorder(),
                              ),
                              child: const Text('All')),
                        ),

                      ],
                    ),
                    SizedBox(height: mediaQueryHeight*0.016,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          height: mediaQueryHeight*0.322,
                          width: mediaQueryWidth,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => categoryCard(
                                name: categories[index].categoryName,
                                image: categories[index].imagePath,
                              places: categories[index].places,
                            ),
                            itemCount: categories.length,
                            controller: categoriesPageController,
                          )
                      ),
                    ),
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
        ],
      ),
    );

    }
  // Returns the next button



}

