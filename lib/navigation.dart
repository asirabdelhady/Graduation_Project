
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/modules/home/homescreen.dart';
import 'package:tour_guide_app/modules/tour/tour_screen.dart';
import 'package:tour_guide_app/modules/weather/weather_screen.dart';
import 'package:tour_guide_app/shared/components/constants.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/modules/notification/notification_screen.dart';
import 'package:tour_guide_app/modules/profile/profile_screen.dart';

class Navigation extends StatefulWidget{
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  @override
  initState(){

    setState(() {

    });
    super.initState();

  }

  int index=2;
  final screens = [
      WeatherScreen(),
    const  TourScreen(),
    const  HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.cloud_queue_rounded, size: 25,color: Colors.white,),
      const Icon(Icons.train_outlined, size: 25,color: Colors.white),
      const Icon(Icons.home_rounded, size: 25,color: Colors.white),
      const Icon(Icons.notifications_none_rounded, size: 25,color: Colors.white),
      const Icon(Icons.person, size: 25,color: Colors.white)
    ];

    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        color: tPrimary(),
          buttonBackgroundColor: const Color(0xff292D32),
          height: 50,
          backgroundColor: Colors.transparent,
          items:items,
        animationDuration: const Duration(milliseconds: 350),
        onTap: (index)=> setState(()=> this.index=index),
      )
    );
  }
}
