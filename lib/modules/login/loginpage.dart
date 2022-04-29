import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';

import '../../navigation.dart';
//bngrb tany
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 23, top: 50),
                      child: Column(
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 36,
                              color: tPrimary(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Transform.scale(
                          scale: 1,
                          child: Column(
                            children: [
                              circleBack(width: 262, height: 275),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                'Please sign in to continue',
                style: TextStyle(
                  color: tGrey(),
                  fontSize: 18,
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
                      padding: const EdgeInsetsDirectional.only(top: 35),
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
                              height: 10,
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
                              height: 40,
                            ),
                            mainButton(
                                minWidth: 95,
                                height: 40,
                                text: 'Login',
                                fontSize: 13,

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
                                  ;

                                  /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return homescreen();
                                    },
                                  )
                              );*/
                                },
                                imagepath: 'assets/images/arrow.png')
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
