import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';

import '../home/homescreen.dart';

class signUpPage extends StatefulWidget{
  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:
            [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  children:
                  [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 23,top: 50),
                      child:
                      Column(
                        children:
                        [
                          Text('Create',
                            style: TextStyle(
                              fontSize: 36,
                              color: navyBlue(),
                            ),
                          ),
                          Text('Account',
                            style: TextStyle(
                              fontSize: 36,
                              color: navyBlue(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,

                        child:Transform.scale(
                          scale: 1,
                          child: Column(
                            children:
                            [
                              circleBack(width: 262,height: 275),
                            ],
                          ),
                        )

                    ),
                  ],
                ),
              ),

              SizedBox(height: 17,
              ),
              Stack(
                children:
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    child: Container(
                      height: 391,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: navyBlue(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 33),
                        child: Center(
                            child:
                            mainFormField(hintText: 'Full Name', iconPrefix: Icon(Icons.email_outlined))
                        ),
                      ),
                      SizedBox(height: 16,),
                      mainFormField(hintText: 'Email', iconPrefix: Icon(Icons.lock_outline)),
                      SizedBox(height: 16,),

                      mainFormField(hintText: 'Password', iconPrefix: Icon(Icons.lock_outline)),
                      SizedBox(height: 16,),

                      mainFormField(hintText: 'Confirm Password', iconPrefix: Icon(Icons.lock_outline)),

                      SizedBox(height: 50,),
                      mainButton(minWidth: 95, height: 40, text: 'Sign up', fontSize: 13, onPressed:(){
                        print('');

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return homescreen();
                              },
                            )
                        );
                      })
                    ],
                  )

                ],
              )


            ],
          ),
        ),
      ),



    );
  }
}