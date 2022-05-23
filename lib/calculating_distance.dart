
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tour_guide_app/modules/home/location_controller.dart';

import 'dart:math' show cos, sqrt, asin;

import 'package:tour_guide_app/shared/components/constants.dart';


class CalculateDistance extends StatefulWidget{
  @override
  State<CalculateDistance> createState() => _CalculateDistanceState();
}

class _CalculateDistanceState extends State<CalculateDistance> {

  void initState(){
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    getAllEntertainment();

    super.initState();
  }

  List<dynamic> data = [
    {
      "lat": 44.968046,
      "lng": -94.420307
    },{
      "lat": 44.33328,
      "lng": -89.132008
    },{
      "lat": 33.755787,
      "lng": -116.359998
    },{
      "lat": 33.844843,
      "lng": -116.54911
    },{
      "lat": 44.92057,
      "lng": -93.44786
    },{
      "lat": 44.240309,
      "lng": -91.493619
    },{
      "lat": 44.968041,
      "lng": -94.419696
    },{
      "lat": 44.333304,
      "lng": -89.132027
    },{
      "lat": 33.755783,
      "lng": -116.360066
    },{
      "lat": 33.844847,
      "lng": -116.549069
    },
  ];

  void printIt(index){
    print(entertainment[index]['googlemaplocation']);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
    '${place.street}, ${place.subLocality}, ${place.locality},${place.country}';
    manteka='${place.subAdministrativeArea}';
    bakyelenwan='${place.street},${place.locality},${place.administrativeArea},${place.country}';

  }


  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          ElevatedButton(onPressed: (){
            /*for(var i = 0; i < entertainment.length-1; i++){
               print(calculateDistance(29.9996435, 31.1638006, entertainment[index]["latitude"], entertainment[index]["longitude"]));
            }*/
            addToEntertainment();

          },
              child: Text('add')),
          ElevatedButton(onPressed: (){

            getAllEntertainment();

          },
              child: Text('get all')),
          ElevatedButton(onPressed: (){

            print('lat: $lat, lng: $long');

          },
              child: Text('get all')),
          ElevatedButton(onPressed: () async {
            Position position = await getGeoLocationPosition();
            for(var i = 0; i < entertainment.length; i++){
              print(calculateDistance(position.latitude, position.longitude, entertainment[i]["latitude"], entertainment[i]["longitude"]));
            }

          },
              child: Text('calculate')),
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

        ],),
      ),
    );

  }
}