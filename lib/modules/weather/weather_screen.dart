import 'dart:ui';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
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
        bottom: false,
        child: Padding(
          padding:  EdgeInsets.all(mediaQueryHeight*0.013),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Weather',
                  style:  TextStyle(
                    fontSize: mediaQueryHeight*0.053,
                    fontWeight: FontWeight.bold,
                      color: tPrimary(),
                  ),
                ),
                SizedBox(height: mediaQueryHeight*0.013,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on,
                      color: tPrimary(),
                    ),
                    SizedBox(height: mediaQueryHeight*0.013,
                    ),
                    Text('6 October',
                      style: TextStyle(fontSize: mediaQueryHeight*0.039, color: tPrimary(),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: mediaQueryHeight*0.013,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,
                  // textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('12°',
                      style: TextStyle(fontSize: mediaQueryHeight*0.066,
                        fontWeight: FontWeight.bold,
                        color: tPrimary(),),
                    ),
                    Text('c',
                      style: TextStyle(fontSize: mediaQueryHeight*0.066,
                        fontWeight: FontWeight.bold,
                        color: tPrimary(),),
                    ),
                  ],
                ),
                SizedBox(height: mediaQueryHeight*0.013,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Clear Sky',
                      style: TextStyle(fontSize: mediaQueryHeight*0.039,
                        color: tPrimary(),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: mediaQueryHeight*0.039,
                ),


                Row(
                  children: [
                    Text('TODAY\'S FORECAST',style: TextStyle(fontSize: mediaQueryHeight*0.019,
                      fontWeight: FontWeight.bold,
                      color: tPrimary(),
                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQueryHeight*0.013,
                ),
                Container(
                  height: mediaQueryHeight*0.239,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildTodayItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: mediaQueryWidth*0.020,
                    ),
                    itemCount: 10,
                  ),
                ),
                Row(
                  children: [
                    Text('5-DAYS FORECAST',style: TextStyle(fontSize: mediaQueryHeight*0.019,
                      fontWeight: FontWeight.bold,)),
                  ],
                ),
                SizedBox(
                  height: mediaQueryHeight*0.006,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildPerDayItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: mediaQueryHeight*0.019,
                  ),
                  itemCount: 10,
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
      Builder(
        builder: (context) {
         // var mediaQueryHeight=MediaQuery.of(context).size.height;
          var mediaQueryWidth=MediaQuery.of(context).size.width;
          return Row(
            children: [
              Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: mediaQueryWidth*0.22,
                                child: Text('Wednesday',
                                  )

                            ),
                            SizedBox(width: mediaQueryWidth*0.263,),
                            Icon(Icons.wb_sunny_outlined),
                            SizedBox(width: mediaQueryWidth*0.263,),
                            Text('5°-15°'),
                          ],
                        ),
                      ]
                  ),
                ],
              )
            ],
          );
        }
      );

}
