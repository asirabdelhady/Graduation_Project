import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/modules/categories/category_screen.dart';
import 'package:tour_guide_app/modules/categories/categorypage.dart';
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

    print('curent hight is '+mediaQueryHeight.toString());
    print('curent hight is '+mediaQueryWidth.toString());
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: mediaQueryHeight*0.043,
                width: mediaQueryWidth*0.5,
                margin: EdgeInsets.only(bottom: 10,),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: 17,
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
                          borderRadius: BorderRadius.circular(20),
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
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 150,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 5,
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
              SizedBox(height: 24,),
              cardBuilderWithDotIndicator(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  subTitle(subTitle: 'Categories'),
                  Container(
                    height: 30,
                    width: 60,
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

              SizedBox(height: 60,),



              //AnimatedSmoothIndicator(activeIndex: activeIndex, count: 4)



            ],),
        ),
      ),
    );

    }

}

