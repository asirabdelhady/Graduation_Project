import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';

import '../../navigation.dart';
class loginPage extends StatefulWidget {
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passorno = true;
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
                    padding:
                         EdgeInsetsDirectional.only(start: mediaQueryWidth*0.0718, top: mediaQueryHeight*0.163),
                    child: Column(
                      children: [
                        defaultTitle(title: 'Login'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mediaQueryHeight*0.027,
              ),
              Text(
                'Please sign in to continue',
                style: TextStyle(
                  color: tGrey(),
                  fontSize: mediaQueryWidth*0.056,
                ),
              ),
              SizedBox(
                height: mediaQueryHeight*0.027,
              ),
              Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.035),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.43,
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
                      padding:  EdgeInsetsDirectional.only(top: mediaQueryHeight*0.057),
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
                                suffixPressed: null, validatorFunction: null, onFieldSubmitted: null, onChanged: null),
                            SizedBox(
                              height: mediaQueryHeight*0.0163,
                            ),
                            mainFormField(
                                hintText: 'Password',
                                imagepath: 'assets/images/lock.png',
                                TextInputType: TextInputType.visiblePassword,
                                passorno: passorno,
                                suffixicon: Icon((passorno==false)? Icons.remove_red_eye : Icons.visibility_off,),
                                controller: passwordController,
                                suffixPressed: (){
                                  setState(() {
                                    passorno=!passorno;
                                  });
                                }, validatorFunction: null, onChanged: null, onFieldSubmitted: null),
                            SizedBox(
                              height: mediaQueryHeight*0.0655,
                            ),
                            mainButton(
                                minWidth: mediaQueryWidth*0.296,
                                height: mediaQueryHeight*0.0065,
                                text: 'Login',
                                fontSize: mediaQueryWidth*0.40,

                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print(emailController.text);
                                    print(passwordController.text);

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
