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
  List lAttractions = [];

  @override
  initState(){
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    getAllAttractions().then((value) {
      return setState((){}) ;
    });
  }

  Future addToAttractions() async {
    FirebaseFirestore.instance.collection('tAttraction').doc().set(
        {
          "number": 24,
          "name": "Al-Muizz Street",
          "latitude": 30.051,
          "longitude": 31.2615,
          "image": "https://drive.google.com/file/d/1oHoFnBp_FzdlB7I7CoLtv-SdDjsQ-rBD/view?usp=sharing",
          "description": "The northern section of Al-Muizz li-Din Allah Street is rimmed by fine Mamluk buildings, which have been painstakingly restored to their former glory.\nThe Madrassa of as-Salih Ayyub, built in 1247, is a showcase of the tranquil simplicity of Islamic architecture.\nDirectly across the road from the madrassa is the drop-dead gorgeous Madrassa of Qalaun, rightly considered one of the Mamluk period's greatest architectural triumphs.",
          "googlemaplocation": "https://www.google.com/maps/place/Al+Moez+Ldin+Allah+Al+Fatmi,+El-Gamaleya,+El+Gamaliya,+Cairo+Governorate/@30.0509352,31.2593861,17z/data=!3m1!4b1!4m5!3m4!1s0x1458409e3b8bb121:0x9373489d8a5bf150!8m2!3d30.0509306!4d31.2615748"
        }
    );
  }

  Future getAllAttractions() async {
    FirebaseFirestore.instance.collection('tAttraction').get().then((value) {
      value.docs.forEach((element) {
        attractions.add(element.data());
      });
    }).then((value) => print('$attractions'));
  }

  Future addToHotels() async {
    FirebaseFirestore.instance.collection('hotels').doc().set(
        {
          "number": 24,
          "name": "Al-Muizz Street",
          "latitude": 30.051,
          "longitude": 31.2615,
          "image": "https://drive.google.com/file/d/1oHoFnBp_FzdlB7I7CoLtv-SdDjsQ-rBD/view?usp=sharing",
          "description": "The northern section of Al-Muizz li-Din Allah Street is rimmed by fine Mamluk buildings, which have been painstakingly restored to their former glory.\nThe Madrassa of as-Salih Ayyub, built in 1247, is a showcase of the tranquil simplicity of Islamic architecture.\nDirectly across the road from the madrassa is the drop-dead gorgeous Madrassa of Qalaun, rightly considered one of the Mamluk period's greatest architectural triumphs.",
          "googlemaplocation": "https://www.google.com/maps/place/Al+Moez+Ldin+Allah+Al+Fatmi,+El-Gamaleya,+El+Gamaliya,+Cairo+Governorate/@30.0509352,31.2593861,17z/data=!3m1!4b1!4m5!3m4!1s0x1458409e3b8bb121:0x9373489d8a5bf150!8m2!3d30.0509306!4d31.2615748"
        }
    );
  }

  Future getAllHotels() async {
    FirebaseFirestore.instance.collection('hotels').get().then((value) {
      value.docs.forEach((element) {
        hotels.add(element.data());
      });
    }).then((value) => print('$hotels'));
  }

  Future addToEntertainment() async {
    FirebaseFirestore.instance.collection('entertainment').doc().set(
        {
          "number": 24,
          "name": "Al-Muizz Street",
          "latitude": 30.051,
          "longitude": 31.2615,
          "image": "https://drive.google.com/file/d/1oHoFnBp_FzdlB7I7CoLtv-SdDjsQ-rBD/view?usp=sharing",
          "description": "The northern section of Al-Muizz li-Din Allah Street is rimmed by fine Mamluk buildings, which have been painstakingly restored to their former glory.\nThe Madrassa of as-Salih Ayyub, built in 1247, is a showcase of the tranquil simplicity of Islamic architecture.\nDirectly across the road from the madrassa is the drop-dead gorgeous Madrassa of Qalaun, rightly considered one of the Mamluk period's greatest architectural triumphs.",
          "googlemaplocation": "https://www.google.com/maps/place/Al+Moez+Ldin+Allah+Al+Fatmi,+El-Gamaleya,+El+Gamaliya,+Cairo+Governorate/@30.0509352,31.2593861,17z/data=!3m1!4b1!4m5!3m4!1s0x1458409e3b8bb121:0x9373489d8a5bf150!8m2!3d30.0509306!4d31.2615748"
        }
    );
  }

  Future getAllEntertainment() async {
    FirebaseFirestore.instance.collection('tAttraction').get().then((value) {
      value.docs.forEach((element) {
        entertainment.add(element.data());
      });
    }).then((value) => print('$entertainment'));
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
