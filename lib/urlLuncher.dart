import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tour_guide_app/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/components/constants.dart';

class Test extends StatefulWidget
{
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('yarab'),
      ),
      body:Center(
          child:Column(
            children:
            [
              buildButton(text: 'open link',
                onClicked:()=>Utils.openLink(url:''),),

            ],
          ),
      ) ,
    );

  }
  Widget buildButton({
  required String text,
    required VoidCallback onClicked,
})=>Container(
    padding: EdgeInsets.symmetric(vertical: 12),
    child: RaisedButton(
      shape: StadiumBorder(),
      onPressed: onClicked,
      color: Colors.red,
      textColor: Colors.white,
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    ),
  );
}











////////////////////////////////////
/*Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: attractions.length,
                itemBuilder: (context, index) => defualtCard(attractions[index])),
          ),
          ElevatedButton(onPressed: (){
            getAllAttractions();
            setState(() {

            });
          },
              child: Text('get'))
        ],),
      ),
    );*/
///////////////////////////////////

