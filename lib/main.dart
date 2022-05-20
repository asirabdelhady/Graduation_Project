import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tour_guide_app/hero_test.dart';
import 'package:tour_guide_app/modules/categories/category_screen.dart';
import 'package:tour_guide_app/modules/home/homescreen.dart';
import 'package:tour_guide_app/modules/welcome/welcomepage.dart';
import 'package:tour_guide_app/second_detail.dart';
import 'package:tour_guide_app/shared/components/constants.dart';
import 'package:tour_guide_app/sq_database.dart';
import 'package:tour_guide_app/test_databse.dart';


void main() async{
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: SecondDetails(tAttractions),
    debugShowCheckedModeBanner: false,
    );
  }
  }