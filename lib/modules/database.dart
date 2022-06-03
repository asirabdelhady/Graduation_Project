import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import '../shared/components/constants.dart';
import 'home/location_controller.dart';



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
    getAllAttractions();
    setState(() {

    });
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
                  addToHotels().then((value) => print('added'));
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
            /*Container(
              height: 300,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: attractions.length,
                    itemBuilder: (context, index) => defualtCard1(attractions[index]))),*/
            IconButton(
              onPressed: () {
                addDistanceToAttractions();
              },
              icon: Icon(Icons.done),
            ),
            IconButton( color: Colors.black,
              icon: const Icon(Icons.my_location_outlined),
              onPressed: () async {
                Position position = await getGeoLocationPosition();
                location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
                GetAddressFromLatLong(position);
                print('location gotten');

                // print(location);
                lat='${position.latitude}' ;
                long='${position.longitude}';

                print(lat);
                print(long);

              },
            ),
          ],
        ),
      ),
    );
  }
}
