import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../navigation/navigation.dart';

class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passorno = true;
  String password = '';

  @override
  Widget build(BuildContext context) {

    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: mediaQueryWidth * 0.0718,
                        top: mediaQueryHeight * 0.163),
                    child: Column(
                      children: [
                        defaultTitle(title: 'Login'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mediaQueryHeight * 0.027,
              ),
              Text(
                'Please sign in to continue',
                style: TextStyle(
                  color: tGrey(),
                  fontSize: mediaQueryWidth * 0.056,
                ),
              ),
              SizedBox(
                height: mediaQueryHeight * 0.027,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.035),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: tPrimary(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: mediaQueryHeight * 0.057),
                      child: Center(
                        child: Column(
                          children: [
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
                            SizedBox(
                              height: mediaQueryHeight * 0.0163,
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
                              height: mediaQueryHeight * 0.0655,
                            ),
                            MaterialButton(
                              onPressed: () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return Navigation();
                                    },
                                  ));
                                }).catchError((error) {
                                  Fluttertoast.showToast(
                                      msg:
                                      'Check your email or password',
                                      toastLength: Toast.LENGTH_LONG,);
                                });
                              },
                              minWidth: mediaQueryWidth * 0.2968,
                              height: mediaQueryHeight * 0.066,
                              color: const Color(0xFFFFFAED),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              child: Container(
                                width: mediaQueryWidth * 0.444,
                                height: mediaQueryHeight * 0.039,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        color: const Color(0xFF292D32),
                                        fontSize: mediaQueryWidth * 0.05,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      'assets/images/arrow.png',
                                      width: mediaQueryWidth * 0.052,
                                      height: mediaQueryHeight * 0.026,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
