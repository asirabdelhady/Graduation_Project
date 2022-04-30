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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 23, top: 50),
                      child: Column(
                        children: [
                          Text(
                            'Create',
                            style: TextStyle(
                              fontSize: 36,
                              color: tPrimary(),
                            ),
                          ),
                          Text(
                            'Account',
                            style: TextStyle(
                              fontSize: 36,
                              color: tPrimary(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Transform.scale(
                          scale: 1,
                          child: Column(
                            children: [
                              circleBack(width: 190, height: 190),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Stack(
                children: [
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 28),
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
                            suffixicon: Icon(null), onChanged: null, onFieldSubmitted: null,
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                            suffixPressed: null, onFieldSubmitted: null, onChanged: null),
                        SizedBox(
                          height: 10,
                        ),
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
                          height: 10,
                        ),
                        mainFormField(
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
                          height: 50,
                        ),
                        mainButton(
                            minWidth: 95,
                            height: 40,
                            text: 'Sign up',
                            fontSize: 13,
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
