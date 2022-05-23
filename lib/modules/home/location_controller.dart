import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

String location = 'Null, Press Button';
String Address = 'search';
String manteka='press the location icon';
String bakyelenwan='to get your location';
String forweather='';
String weather='';
double lat=0.0;
double long=0.0;


Future<Position> getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
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
  forweather='${place.administrativeArea}';
  weather='${place.administrativeArea}';
  lat=double.parse('${position.latitude}');
  long=double.parse('${position.longitude}');
  print('lat=$lat');
  print('long=$long');



}
