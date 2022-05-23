import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/details.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';
import 'package:tour_guide_app/shared/components/components.dart';

import '../shared/components/constants.dart';

class MyFirebase extends StatefulWidget {
  @override
  State<MyFirebase> createState() => _MyFirebaseState();
}

class _MyFirebaseState extends State<MyFirebase> {

  @override
  initState(){
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    //getAllHotels().then((value) => setState((){}));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  addToAttractions().then((value) => print('added'));
                },
                child: Text('Add')),
            ElevatedButton(
                onPressed: () {
                  getAllAttractions().then((value) => print('gotten'));
                },
                child: Text('getall')),
            ElevatedButton(
                onPressed: () {
                  setState(() {

                  });
                },
                child: Text('setstate')),
            Container(
              height: 300,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: attractions.length,
                    itemBuilder: (context, index) => defualtCard(attractions[index])))
          ],
        ),
      ),
    );
  }
}