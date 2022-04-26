
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget{
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int index =0;
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(child: Text('Weather Screen')),

    );
  }
}