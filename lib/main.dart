import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/modules/categories/category_screen.dart';
import 'package:tour_guide_app/modules/home/homescreen.dart';
import 'package:tour_guide_app/modules/login/loginpage.dart';
import 'package:tour_guide_app/modules/notification/notification_screen.dart';
import 'package:tour_guide_app/modules/tour/tour_screen.dart';
import 'package:tour_guide_app/navigation.dart';

import 'modules/signup/signuppage.dart';
import 'modules/welcome/welcomepage.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

  class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Navigation(),
    debugShowCheckedModeBanner: false,
    );
  }
  }