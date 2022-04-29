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

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 25,color: tPrimary(),),
          Icon(Icons.calendar_today, size: 25,color: tPrimary(),),
          Icon(Icons.person_outline_outlined, size: 25,color: tPrimary(),),
        ],
        onTap: (index) {
          //Handle button tap
        },

      ),
      backgroundColor: Colors.white,

      body:
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.cloud_circle_rounded,
                    size: 40,color: tPrimary(),)
                ],
              ),
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
                    width: 20.0,
                  ),
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 25.0,
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
                  height: 20.0,
                ),
                itemCount: 5,
              ),
            ],
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
        SizedBox(width: 70,),
        Icon(Icons.wb_sunny_outlined),
        SizedBox(width: 70,),
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
        width: 90.0,
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
                      ),
                    ),
                    SizedBox(height: 11,),
                    Icon(Icons.cloud_outlined, color: Colors.black,
                    )
                  ],
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                    color: tGrey(),
                  ),
                  width: 90,
                  height: 160,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 10.0,
                  ),
                  child: CircleAvatar(
                    child:
                    Text('15° C',
                      style: TextStyle(color: Colors.white),
                    ),
                    radius: 35.0,
                    backgroundColor: tPrimary(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
