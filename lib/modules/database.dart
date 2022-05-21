import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/components/components.dart';

import '../shared/components/constants.dart';

class MyFirebase extends StatefulWidget {
  @override
  State<MyFirebase> createState() => _MyFirebaseState();
}

class _MyFirebaseState extends State<MyFirebase> {
  //List attractions = [];

  Future add() async {
    FirebaseFirestore.instance.collection('tAttraction').doc().set({
      "number": 2,
      "name": "Al-Azhar Mosque",
      "latitude": 30.0457,
      "longitude": 31.2627,
      "description": "Al-Azhar Mosque is right in the centre of the downtown area and in addition to being a mosque, it is one of the oldest universities in the world. The spectacular landmark has a huge primary gateway allowing visitors to enter inside and explore the stunning architecture of this marvel. The five minarets of the mosque can be clearly seen and felt. Visitors often sit inside and pray in the central hall to get some respite from the outer busy world.",
      "googlemaplocation": "https://www.google.com/maps/place/Al-Azhar+Mosque/@30.0456926,31.2604964,17z/data=!3m1!4b1!4m5!3m4!1s0x145840a2f3fd21f5:0x676752c74b1e52e8!8m2!3d30.045688!4d31.2626851",

    });
  }

  Future getAll() async {
    FirebaseFirestore.instance.collection('tAttraction').get().then((value) {
      value.docs.forEach((element) {
        attractions.add(element.data());
      });
    }).then((value) => print('$attractions'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  add().then((value) => print('added'));
                },
                child: Text('Add')),
            ElevatedButton(
                onPressed: () {
                  getAll().then((value) => print('gotten'));
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
                child: PageView.builder(
                  itemCount: attractions.length,
                    itemBuilder: (context, index) => defualtCard(attractions[index])))
          ],
        ),
      ),
    );
  }
}
