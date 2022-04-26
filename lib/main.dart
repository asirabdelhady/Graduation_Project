import 'package:flutter/material.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';
import 'package:tour_guide_app/modules/profile/profile_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}