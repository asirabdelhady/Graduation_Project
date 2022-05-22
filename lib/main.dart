import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/details.dart';
import 'package:tour_guide_app/modules/categories/category_screen.dart';
import 'package:tour_guide_app/modules/home/homescreen.dart';
import 'package:tour_guide_app/modules/welcome/welcomepage.dart';
import 'package:tour_guide_app/shared/components/constants.dart';
import 'modules/database.dart';
import 'modules/login/loginpage.dart';
import 'modules/signup/signuppage.dart';
import 'navigation.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp();
}

  class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: Navigation(),
    debugShowCheckedModeBanner: false,
    );
  }
  }