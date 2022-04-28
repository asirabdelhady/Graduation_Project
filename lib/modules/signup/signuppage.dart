import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';

import '../../navigation.dart';
import '../home/homescreen.dart';

class signUpPage extends StatefulWidget{
  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var nameController= TextEditingController();
  var confPasswordController= TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool passorno = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          Column(
            children:
            [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child:
                Row(
                  children:
                  [
                    SizedBox(width: 15,),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 23,top: 50),
                      child:
                      Column(
                        children:
                        [
                          Text('Create',
                            style: TextStyle(
                              fontSize: 36,
                              color: tPrimary(),
                            ),
                          ),
                          Text('Account',
                            style: TextStyle(
                              fontSize: 36,
                              color: tPrimary(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50,),
                    Align(
                        alignment: Alignment.topRight,

                        child:Transform.scale(
                          scale: 1,
                          child: Column(
                            children:
                            [
                              circleBack(width: 190,height: 190),
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
                      height: MediaQuery.of(context).size.height * 0.63,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: tPrimary(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Form(
                    key:formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 28),
                          child: Center(
                              child:
                              mainFormField(
                                hintText: 'Full Name',
                                imagepath: 'assets/images/Fullname.png',
                                TextInputType: TextInputType.name,
                                passorno:false,
                                controller: nameController,
                                validatorText: 'Name must\'t be empty',
                                suffixPressed: null,
                                suffixicon: Icon(null),
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        mainFormField(hintText: 'Email',
                            imagepath: 'assets/images/mail.png',
                            TextInputType: TextInputType.emailAddress,
                            passorno: false,
                            suffixicon: Icon(null),
                            controller: emailController,
                            validatorText: 'E-mail must\'t be empty',
                            suffixPressed: null),
                        SizedBox(height: 10,),
                        mainFormField(hintText: 'Password',
                            imagepath: 'assets/images/lock.png',
                            TextInputType: TextInputType.visiblePassword,
                            passorno: passorno,
                            suffixicon: Icon((passorno==false)? Icons.remove_red_eye : Icons.visibility_off,),
                            controller: passwordController,
                            validatorText: 'Password must\'t be empty',
                            suffixPressed:(){
                              setState(() {
                                passorno=!passorno;
                              });
                            }

                            ),
                        SizedBox(height: 10,),
                        mainFormField(hintText: 'Confirm Password',
                            imagepath: 'assets/images/lock.png',
                            TextInputType: TextInputType.visiblePassword,
                            passorno: passorno,
                            suffixicon: Icon((passorno==false)? Icons.remove_red_eye : Icons.visibility_off,),
                            controller: confPasswordController,
                            validatorText: 'Password must\'t be empty',
                            suffixPressed: (){
                              setState(() {
                                passorno=!passorno;
                              });
                            }),
                        SizedBox(height: 50,),
                        mainButton(minWidth: 95, height: 40,
                            text: 'Sign up', fontSize: 13, onPressed:(){
                              if(formKey.currentState!.validate()){
                                print(nameController.text);
                                print(emailController.text);
                                print(passwordController.text);
                                print(confPasswordController.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Navigation();
                                      },
                                    )
                                );
                              };

                              /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return homescreen();
                                },
                              )
                          );*/
                            }, imagepath: 'assets/images/arrow.png')
                      ],
                    ),
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