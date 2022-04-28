
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';


class categorypage extends StatefulWidget {
  @override
  State<categorypage> createState() => _categorypageState();
}

class _categorypageState extends State<categorypage> {

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {



    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0,vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children:
            [
              Row(
                children:
                [
                  Text('Category',
                    style: TextStyle(
                      fontSize: 36,
                      color: tPrimary(),
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12),
                    child: Text('Pyramdis',
                      style: TextStyle(
                        fontSize: 16,
                        color: tGrey(),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 16,),
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
              ),
              SizedBox(height: 16,),
              SingleChildScrollView(
                child:
                Column(
                  children: [
                    categoryCard(minWidth: 101, height: 37, sightname: 'Pyramids', onPressed: (){}, imagePath: 'images/egypt-cairo-pyramids-of-giza-and camels-2.jpg'),
                    SizedBox(height: 10,),
                    categoryCard(minWidth: 101, height: 37, sightname: 'Cairo Tower', onPressed: (){},imagePath: 'images/egypt-cairo-pyramids-of-giza-and camels-2.jpg'),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}
