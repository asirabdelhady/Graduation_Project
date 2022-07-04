import 'dart:async';

import 'package:easy_geofencing/enums/geofence_status.dart';
import 'package:flutter/material.dart';
import 'package:easy_geofencing/easy_geofencing.dart';
import 'package:geolocator/geolocator.dart';



class geofence extends StatefulWidget {
  //get title => null;

  @override
  State<geofence> createState() => _geofenceState();
}

class _geofenceState extends State<geofence> {
  TextEditingController latitudeController = new TextEditingController();

  TextEditingController longitudeController = new TextEditingController();

  TextEditingController radiusController = new TextEditingController();

  StreamSubscription<GeofenceStatus>? geofenceStatusStream;

  Geolocator geolocator = Geolocator();

  String geofenceStatus = '';

  bool isReady = false;

  Position? position;

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  void dispose() {
    latitudeController.dispose();
    longitudeController.dispose();
    radiusController.dispose();
    super.dispose();}
  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("LOCATION => ${position!.toJson()}");
    isReady = (position != null) ? true : false;
  }

  setLocation() async {
    await getCurrentPosition();
    // print("POSITION => ${position!.toJson()}");
    latitudeController =
        TextEditingController(text: position!.latitude.toString());
    longitudeController =
        TextEditingController(text: position!.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fdghjk'),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              if (isReady) {
                setState(() {
                  setLocation();
                });
              }
            },
          ),
        ],
      ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: latitudeController,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter pointed latitude'),
              ),
              TextField(
                controller: longitudeController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter pointed longitude'),
              ),
              TextField(
                controller: radiusController,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter radius in meter'),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("Start"),
                    onPressed: () {
                      print("starting geoFencing Service");
                      EasyGeofencing.startGeofenceService(
                          pointedLatitude: latitudeController.text,
                          pointedLongitude: longitudeController.text,
                          radiusMeter: radiusController.text,
                          eventPeriodInSeconds: 5);
                      if (geofenceStatusStream == null) {
                        geofenceStatusStream = EasyGeofencing.getGeofenceStream()!
                            .listen((GeofenceStatus status) {
                          print(status.toString());
                          setState(() {
                            geofenceStatus = status.toString();
                          });
                        });
                      }
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RaisedButton(
                    child: Text("Stop"),
                    onPressed: () {
                      print("stop");
                      EasyGeofencing.stopGeofenceService();
                      geofenceStatusStream!.cancel();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "Geofence Status: \n\n\n" + geofenceStatus,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      
 
    );
    
  }
  
}