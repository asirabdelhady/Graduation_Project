import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/modules/categories/category_screen.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: mediaQueryHeight*0.043,
                  width: mediaQueryWidth*0.5,
                  margin: EdgeInsets.only(bottom: mediaQueryWidth*0.03125,),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(mediaQueryWidth*0.009375, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                        size: mediaQueryWidth*0.053125,
                      ),
                    ),
                  ),
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
                SizedBox(
                  height:mediaQueryHeight*0.016,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print('preseed');
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
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: mediaQueryWidth*0.0781,
                                  ),

                                  Text(
                                    'Search',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
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
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                SizedBox(height: mediaQueryHeight*0.039,),
                cardBuilderWithDotIndicator(),
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
                cardBuilderWithDotIndicator(),
                SizedBox(height: mediaQueryHeight*0.016,),

                SizedBox(height: mediaQueryHeight*0.098,),



                //AnimatedSmoothIndicator(activeIndex: activeIndex, count: 4)



              ],),
          ),
        ),
      ),
    );

    }

}

