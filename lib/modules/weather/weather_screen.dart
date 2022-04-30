import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';

class WeatherScreen extends StatefulWidget
{
  @override
  State<WeatherScreen> createState() => _WeatherScreen();
}

class _WeatherScreen extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(


      body:
      SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Text('Weather',
                  style:  TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                      color: tPrimary(),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on,
                      color: tPrimary(),
                    ),
                    SizedBox(height: 10,
                    ),
                    Text('6 October',
                    style: TextStyle(fontSize: 30, color: tPrimary(),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  // textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('12°',
                      style: TextStyle(fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: tPrimary(),),
                    ),
                    Text('c',
                      style: TextStyle(fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: tPrimary(),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Clear Sky',
                      style: TextStyle(fontSize: 30,
                        color: tPrimary(),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),


                Row(
                  children: [
                    Text('TODAY\'S FORECAST',style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: tPrimary(),
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 180.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildTodayItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 7.5,
                    ),
                    itemCount: 10,
                  ),
                ),
                Row(
                  children: [
                    Text('5-DAYS FORECAST',style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,)),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildPerDayItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15.0,
                  ),
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  // 1. build item
  Widget buildPerDayItem() =>
      Row(
        children: [
          Stack(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
      children: [
        Container(
                width: 80
                ,child: Text('Wednesday',
              maxLines: 1,overflow:TextOverflow.ellipsis,)

        ),
        SizedBox(width: 95,),
        Icon(Icons.wb_sunny_outlined),
        SizedBox(width: 95,),
        Text('5°-15°'),
  ],
  ),
              ]
      ),
  ),
            ],
          )
  ],
      );

  Widget buildTodayItem() =>
      Container(
        width: 60.0,
        child:
        Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  child: Column(
                    children: [
                    SizedBox(height: 20,),
                    Text('09:00 AM',
                      style: TextStyle(color: Colors.black,
                        fontSize: 11
                      ),
                    ),
                    SizedBox(height: 5,),
                    Icon(Icons.cloud_outlined, color: Colors.black,
                    )
                  ],
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                    color: tGrey(),
                  ),
                  width: 90,
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 5.0,
                  ),
                  child: CircleAvatar(
                    child:
                    Text('15° C',
                      style: TextStyle(color: Colors.white),
                    ),
                    radius: 25.0,
                    backgroundColor: tPrimary(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
