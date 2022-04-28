import 'package:flutter/material.dart';
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                        height: mediaQueryHeight*0.16,
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
                height:10,
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
              SizedBox(
                height: 24,
              ),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      categorybutton(
                          text: 'All',
                          iconshape: Icons.plus_one_sharp,
                          ontap: () {
                            print('pressed');
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      categorybutton(
                          text: 'Music',
                          iconshape: Icons.music_note_outlined,
                          ontap: null),
                      SizedBox(
                        width: 10,
                      ),
                      categorybutton(
                          text: 'Transport',
                          iconshape: Icons.emoji_transportation_outlined,
                          ontap: null),
                      SizedBox(
                        width: 10,
                      ),
                      categorybutton(
                          text: 'Cafe',
                          iconshape: Icons.local_cafe_outlined,
                          ontap: null),
                    ],
                  ),
                ),
              ), //category
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: tPrimary(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  homeScreenRecommendedCard(
                      imagePath: 'assets/images/egypt-cairo-pyramids-of-giza-and camels-2.jpg',
                      onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen();
                            },
                          )
                      );},
                      height: mediaQueryHeight*0.2,
                      width:mediaQueryWidth*0.4),
                  SizedBox(width: 10,),
                  homeScreenRecommendedCard(
                      imagePath: 'assets/images/egypt-cairo-pyramids-of-giza-and camels-2.jpg',
                      onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen();
                            },
                          )
                      );
                        },
                      height: mediaQueryHeight*0.2,
                      width: mediaQueryWidth*0.4),
                ],
              ),



            ],
          ),
        ),
      ),
    );

  }

}
