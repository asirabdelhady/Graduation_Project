import 'package:flutter/material.dart';
import 'package:tour_guide_app/modules/categories/category_screen.dart';
import 'package:tour_guide_app/modules/home/homescreen.dart';
import 'package:tour_guide_app/modules/tour/tour_screen.dart';
import 'package:tour_guide_app/navigation.dart';

import 'modules/welcome/welcomepage.dart';

void main(){
  runApp(MyApp());
}

  class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(),
    debugShowCheckedModeBanner: false,
    );
  }
  }