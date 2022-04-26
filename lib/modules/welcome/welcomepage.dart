import 'package:flutter/material.dart';
import 'package:tour_guide_app/modules/login/loginpage.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

class welcomepage extends StatefulWidget{
  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Column(
          children:
          [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),

              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 23,top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome,',
                          style: TextStyle(
                            fontSize: 36,
                            color: navyBlue(),
                          ),
                        ),
                        Text('Explorer',
                          style: TextStyle(
                            fontSize: 36,
                            color: navyBlue(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 17
                    ,),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 20),
                    child:circleBack(width: 228,height: 228),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,
            ),
            SizedBox(height: 12,),
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
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        children:
                        [
                          Text('lets get started',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                          ),),
                          SizedBox(height: 16,),
                          mainButton(minWidth: 222, height: 53, text: 'Create Account', fontSize: 18,onPressed: (){
                            //signup page
                          }),
                          SizedBox(height: 16,
                          ),
                          Text('Already have an',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                            ),),
                          Text('account?',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                            ),),
                          SizedBox(height: 16,),
                          mainButton(minWidth: 222, height: 53, text: 'Login', fontSize: 18, onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return loginPage();
                                  },
                                )
                            );
                          }),

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
