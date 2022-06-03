import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../navigation/navigation.dart';

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
  String email='';
  String confirmPassword = '';
  DateTime selectedDate = DateTime(2004,1,1);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950,9),
        lastDate: DateTime(2004));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: tPrimary(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Form(
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
                        SizedBox(height: 15,),
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
                        SizedBox(height: 15,),
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
                          height: 15,
                        ),
                        Stack(
                          children: [
                            Center(
                              child: Container(
                                width: mediaQueryWidth*0.6,
                                height: mediaQueryHeight*0.11,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text('Enter you birthday date',
                                    style: TextStyle(
                                      fontSize: 14
                                    ),),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text("${selectedDate.toLocal()}".split(' ')[0],
                                        style: TextStyle(
                                          fontSize: 16
                                        ),),
                                        //SizedBox(height: 20.0,),
                                        IconButton(
                                          onPressed: () => _selectDate(context),
                                          icon: Icon(Icons.calendar_today_sharp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed: (){
                            FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text).then((value) {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Navigation();
                                },
                              ));
                            } ).catchError((error){
                              Fluttertoast.showToast(
                                msg:
                                'Email already exist or something went wrong',
                                toastLength: Toast.LENGTH_LONG,);
                            });
                          },
                          minWidth: mediaQueryWidth*0.2968,
                          height: mediaQueryHeight*0.066,
                          color: const Color(0xFFFFFAED),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))),
                          child: Container(
                            width: mediaQueryWidth*0.444,
                            height: mediaQueryHeight*0.039,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: const Color(0xFF292D32),
                                    fontSize: mediaQueryWidth*0.05,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/images/arrow.png',
                                  width: mediaQueryWidth*0.052,
                                  height: mediaQueryHeight*0.026,
                                )
                              ],
                            ),
                          ),
                        )
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
