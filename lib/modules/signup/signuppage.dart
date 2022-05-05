import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../navigation.dart';

class signUpPage extends StatefulWidget {
  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passorno = true;
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                     EdgeInsetsDirectional.only(start: mediaQueryWidth*0.0718, top: mediaQueryHeight*0.0400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultTitle(title: 'Create'),
                    defaultTitle(title: 'Account'),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQueryHeight*0.0278,
              ),
              Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.030),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: mediaQueryHeight*0.040),
                          child: Center(
                              child: mainFormField(
                            hintText: 'Full Name',
                            imagepath: 'assets/images/Fullname.png',
                            TextInputType: TextInputType.name,
                            passorno: false,
                            controller: nameController,
                            validatorFunction: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'This field is required';
                              }
                              if (value.trim().length < 4) {
                                return 'Username must be at least 4 characters ';
                              }
                              // Return null if the entered username is valid
                              return null;
                            },
                            suffixPressed: null,
                            suffixicon: Icon(null),
                                onChanged: null,
                                onFieldSubmitted: null,
                          )),
                        ),
                        SizedBox(height: 5,),
                        mainFormField(
                            hintText: 'Email',
                            imagepath: 'assets/images/mail.png',
                            TextInputType: TextInputType.emailAddress,
                            passorno: false,
                            suffixicon: Icon(null),
                            controller: emailController,
                            validatorFunction:  (value) {
                              // Check if this field is empty
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              // using regular expression
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return "Please enter a valid email address";
                              }

                              // the email is valid
                              return null;
                            },
                            suffixPressed: null,
                            onFieldSubmitted: null,
                            onChanged: null),
                        SizedBox(height: 5,),


                        mainFormField(
                            hintText: 'Password',
                            imagepath: 'assets/images/lock.png',
                            TextInputType: TextInputType.visiblePassword,
                            passorno: passorno,
                            suffixicon: Icon(
                              (passorno == false)
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                            ),
                            controller: passwordController,
                            onChanged: (value) => password = value,
                            validatorFunction: (value) {
                              RegExp regex =
                              RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

                                if (!regex.hasMatch(value)) {
                                  ElevatedButton(
                                     // color: Colors.orange,
                                      child: Text('Bottom Sheet'),
                                      onPressed: () {

                                      });
                                  return 'Please enter a valid password';
                                }
                            },
                            onFieldSubmitted: (value){
                              RegExp regex =
                              RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

                              if(value != regex.hasMatch(value)) {
                                Fluttertoast.showToast(
                                  msg: 'Validate password must contain upper and lower letters , number and at least 8 characters ',
                                  toastLength: Toast.LENGTH_LONG,
                              );
                              }

                            },
                            suffixPressed: () {
                              setState(() {
                                passorno = !passorno;
                              });
                            }),
                        SizedBox(
                          height: 5,
                        ),
                        mainFormField(
                          enable: password!=null&&password.isNotEmpty,

                          hintText: 'Confirm Password',
                            imagepath: 'assets/images/lock.png',
                            TextInputType: TextInputType.visiblePassword,
                            passorno: passorno,
                            onChanged: (value) => confirmPassword = value,
                            suffixicon: Icon(
                              (passorno == false)
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                            ),
                            controller: confPasswordController,

                            validatorFunction: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              if (confirmPassword != password) {
                                return 'Password does not match ';
                              }

                              return null;
                            },

                            suffixPressed: () {
                              setState(() {
                                passorno = !passorno;
                              });
                            }, onFieldSubmitted: null,

                            ),
                        SizedBox(
                          height: mediaQueryHeight*0.055,
                        ),
                        mainButton(
                            minWidth: mediaQueryWidth*0.2968,
                            height: mediaQueryHeight*0.066,
                            text: 'Sign up',
                            fontSize: mediaQueryWidth*0.040,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                print(nameController.text);
                                print(emailController.text);
                                print(passwordController.text);
                                print(confPasswordController.text);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Navigation();
                                  },
                                ));
                              }
                            },
                            imagePath: 'assets/images/arrow.png')
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
