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
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Weather',
                  style:  TextStyle(
                    fontSize: mediaQueryWidth*0.125,
                    fontWeight: FontWeight.bold,
                      color: tPrimary(),
                  ),
                ),
                SizedBox(height: mediaQueryHeight*0.0162,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on,
                      color: tPrimary(),
                    ),
                    SizedBox(height: mediaQueryHeight*0.0162,
                    ),
                    Text('6 October',
                    style: TextStyle(fontSize: mediaQueryWidth*0.125, color: tPrimary(),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: mediaQueryHeight*0.0162,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  // textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('12°',
                      style: TextStyle(fontSize: mediaQueryWidth*0.125,
                        fontWeight: FontWeight.bold,
                        color: tPrimary(),),
                    ),
                    Text('c',
                      style: TextStyle(fontSize: mediaQueryWidth*0.125,
                        fontWeight: FontWeight.bold,
                        color: tPrimary(),),
                    ),
                  ],
                ),
                SizedBox(height: mediaQueryHeight*0.0162,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Clear Sky',
                      style: TextStyle(fontSize: mediaQueryWidth*0.125,
                        color: tPrimary(),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: mediaQueryHeight*0.0491,
                ),


                Row(
                  children: [
                    Text('TODAY\'S FORECAST',style: TextStyle(fontSize: mediaQueryWidth*0.04,
                      fontWeight: FontWeight.bold,
                      color: tPrimary(),
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQueryHeight*0.0163,
                ),
                Container(
                  height: mediaQueryHeight*0.295,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildTodayItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: mediaQueryWidth*0.0625,
                    ),
                    itemCount: 5,
                  ),
                ),
                SizedBox(
                  height: mediaQueryHeight*0.078,
                ),
                Row(
                  children: [
                    Text('5-DAYS FORECAST',style: TextStyle(fontSize: mediaQueryWidth*0.0468,
                      fontWeight: FontWeight.bold,)),
                  ],
                ),
                SizedBox(
                  height: mediaQueryHeight*0.0081,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildPerDayItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: mediaQueryHeight*0.032,
                  ),
                  itemCount: 5,
                ),
                SizedBox(height: mediaQueryHeight*0.0196,)
              ],),
          ),
        ),
      ),

    );
  }

  // 1. build item
  Widget buildPerDayItem() =>
      Builder(
        builder: (context) {
          var mediaQueryHeight=MediaQuery.of(context).size.height;
          var mediaQueryWidth=MediaQuery.of(context).size.width;
          return Row(
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
                                width: mediaQueryWidth*0.281,
                                  child: Text('Wednesday',
                                      maxLines: 1,overflow:TextOverflow.ellipsis,)

            ),
                               SizedBox(width: mediaQueryWidth*0.218,),
                               Icon(Icons.wb_sunny_outlined),
                               SizedBox(width: mediaQueryWidth*0.218,),
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
        }
      );

  Widget buildTodayItem() =>
      Builder(
        builder: (context) {
          var mediaQueryHeight=MediaQuery.of(context).size.height;
          var mediaQueryWidth=MediaQuery.of(context).size.width;
          return Container(
            width: mediaQueryWidth*0.281,
            child:
            Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      child: Column(
                        children: [
                        SizedBox(height: mediaQueryHeight*0.0327,),
                        Text('09:00 AM',
                          style: TextStyle(color: Colors.black,
                          ),
                        ),
                        SizedBox(height: mediaQueryHeight*0.0180,),
                        Icon(Icons.cloud_outlined, color: Colors.black,
                        )
                      ],
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                        color: tGrey(),
                      ),
                      width: mediaQueryWidth*0.281,
                      height: mediaQueryHeight*0.2622,
                    ),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(
                        bottom: mediaQueryHeight*0.0163,
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
      );
}
