
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';


class categorypage extends StatefulWidget {
  @override
  State<categorypage> createState() => _categorypageState();
}

class _categorypageState extends State<categorypage> {


  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    Text('Category',
                      style: TextStyle(
                        fontSize: 36,
                        color: tPrimary(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage('assets/images/Pyramids1.jpg'),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Align(

                      child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage('assets/images/Pyramids1.jpg'),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),


                SingleChildScrollView(
                  child:
                  Column(
                    children: [
                      //categoryCard(minWidth: 101, height: 37, sightname: 'Pyramids', onPressed: (){}, imagePath: 'images/egypt-cairo-pyramids-of-giza-and camels-2.jpg'),
                      SizedBox(height: 10,),
                      //categoryCard(minWidth: 101, height: 37, sightname: 'Cairo Tower', onPressed: (){},imagePath: 'images/egypt-cairo-pyramids-of-giza-and camels-2.jpg'),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}
