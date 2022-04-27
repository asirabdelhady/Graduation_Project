import 'package:flutter/material.dart';

class TourScreen extends StatefulWidget{
  const TourScreen({Key? key}) : super(key: key);


  @override
  State<TourScreen> createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  int index =1;

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(child: Text('Tour Screen')),

    );
  }
}