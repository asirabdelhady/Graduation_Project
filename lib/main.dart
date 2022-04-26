import 'package:flutter/material.dart';
import 'package:tour_guide_app/navigation.dart';

void main(){
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