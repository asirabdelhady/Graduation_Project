import 'package:flutter/material.dart';
import 'package:tour_guide_app/modules/login/loginpage.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/components/constants.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

import '../signup/signuppage.dart';

class welcomepage extends StatefulWidget{
  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
var index;
  @override
  void initState() {
    getAllTour();
    getAllAttractions();
    getAllHotels();
    getAllHistory();
    getAllFavorites();
    getAllEntertainment();
    setState(() {

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(

        child: Column(
          children:
          [
            Row(
              children: [
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: mediaQueryWidth*0.071,top: mediaQueryHeight*0.0163),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultTitle(title: 'Welcome'),
                      defaultTitle(title: 'Explorer'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: mediaQueryHeight*0.0245,
            ),
            Image(
              image: AssetImage('assets/images/Group 67welcomepageimage.png'),
              height: mediaQueryHeight*0.3278,
              width: double.infinity,
            ),
            Expanded(
              child: Stack(
                children:
                [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF292D32),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)
                      ),

                    ),
                    width: double.infinity,
                  ),
                  Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: mediaQueryHeight*0.0459,horizontal: mediaQueryWidth*0.0875),
                      child: Column(
                        children:
                        [
                          Text('lets get started',
                            style: TextStyle(
                                fontSize: mediaQueryWidth*0.0562,
                                color: Colors.white
                            ),),
                          SizedBox(height: mediaQueryHeight*0.02622,),
                          mainButton(
                              minWidth: mediaQueryWidth*0.611,
                              height: mediaQueryHeight*0.066,
                              text: 'Create Account',
                              fontSize: mediaQueryWidth*0.085,
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return signUpPage();
                                      },
                                    )
                                );


                              }, imagePath: 'assets/images/arrow.png'),
                          SizedBox(height: mediaQueryHeight*0.02622,
                          ),
                          Text('Already have an',
                            style: TextStyle(
                                fontSize: mediaQueryWidth*0.0562,
                                color: Colors.white
                            ),),
                          Text('account?',
                            style: TextStyle(
                                fontSize: mediaQueryWidth*0.0562,
                                color: Colors.white
                            ),),
                          SizedBox(height: mediaQueryHeight*0.02622,),
                          mainButton(
                              minWidth: mediaQueryWidth*0.5,
                              height: mediaQueryHeight*0.066,
                              text: 'Login',
                              fontSize: mediaQueryWidth*0.056,
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return loginPage();
                                      },
                                    )
                                );
                              }, imagePath: 'assets/images/arrow.png'),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
