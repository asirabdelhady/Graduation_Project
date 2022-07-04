import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import '../../modules/home/location_controller.dart';

Future addDistanceToAttractions()async{
  Position position = await getGeoLocationPosition();
  for(var i = 0; i < attractions.length; i++){
    var distance= calculateDistance(position.latitude, position.longitude, attractions[i]["latitude"], attractions[i]["longitude"]);
    FirebaseFirestore.instance.collection('tAttraction').doc('$i').update(
        {
          "distance": "${distance.round()} Km"
    }
    );
  }



}

Future addDistanceToHotels()async{
  Position position = await getGeoLocationPosition();
  for(var i = 0; i < hotels.length; i++){
    var distance= calculateDistance(position.latitude, position.longitude, hotels[i]["latitude"], hotels[i]["longitude"]);
    FirebaseFirestore.instance.collection('hotels').doc('$i').update(
        {
          "distance": "${distance.round()} Km"
        }
    );
  }



}

Future addDistanceToEntertainment()async{
  Position position = await getGeoLocationPosition();
  for(var i = 0; i < entertainment.length; i++){
    var distance= calculateDistance(position.latitude, position.longitude, entertainment[i]["latitude"], entertainment[i]["longitude"]);
    FirebaseFirestore.instance.collection('entertainment').doc('$i').update(
        {
          "distance": "${distance.round()} Km"
        }
    );
  }

}

Future addElementToCollection()async{
    FirebaseFirestore.instance.collection('entertainment').get().then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance.collection('All').add(element.data());
      });
    }).then((value) => print('Added'));

}


double calculateDistance(lat1, lon1, lat2, lon2){
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 - c((lat2 - lat1) * p)/2 +
      c(lat1 * p) * c(lat2 * p) *
          (1 - c((lon2 - lon1) * p))/2;
  return 12742 * asin(sqrt(a));
}

class Distance{
  String? distance;

  Distance({this.distance});

  List attractionDis =[];
  List hotelDis=[];
  List entertainmentDis=[];
}

List attractions=[];

List favorites=[];

List tour=[];

List history=[];

List hotels=[];

List entertainment=[];

Future getAllFavorites() async {
  if (favorites.isEmpty){
    FirebaseFirestore.instance.collection('favorites').get().then((value) {
      value.docs.forEach((element) {
        favorites.add(element.data());
      });
    }).then((value) => print('$favorites'));
  }
}

Future getAllTour() async {
    FirebaseFirestore.instance.collection('tour').get().then((value) {
      value.docs.forEach((element) {
        if(tour.contains(element))
        {print('somthing');}else {
        tour.add(element.data());
      }
    });
    }).then((value) => print('$tour'));

}

Future addToFavorites({
  required String name,
  required String image,
  required String location,
  required String distance,
  required String description,
  required String latitude,
  required String longitude,
  required String number,



})async {
  FirebaseFirestore.instance.collection('favorites').doc(number).set(
    {
      "number":number,
      "name": name,
      "latitude": latitude,
      "longitude": longitude,
      "image": image,
      "description": description,
      "googlemaplocation": location

    }
  );
}

Future getAllHistory() async {

    FirebaseFirestore.instance.collection('history').get().then((value) {
      value.docs.forEach((element) {
        history.add(element.data());
      });
    }).then((value) => print('$history'));

}


Future addToHistory({
  required String name,
  required String image,
  required String location,
  required String distance,
  required String description,
  required String latitude,
  required String longitude,


})async {
  FirebaseFirestore.instance.collection('history').doc().set(
      {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "image": image,
        "description": description,
        "googlemaplocation": location

      }
  );
}


Future addToTour({
  required String name,
  required String number,
  required String image,
  required String location,
  required String distance,
  required String description,
  required String latitude,
  required String longitude,


})async {
  FirebaseFirestore.instance.collection('tour').doc(number).set(
      {
        "name": name,
        "number": number,
        "latitude": latitude,
        "longitude": longitude,
        "image": image,
        "description": description,
        "googlemaplocation": location

      }
  );
}



Future addToAttractions() async {
  int number=28;
  FirebaseFirestore.instance.collection('tAttraction').doc('$number').set(
      {
        "number": "$number",
        "name": "Qasr El Nil Bridge\n",
        "rating": 4.7,
        "latitude": 30.0438,
        "longitude": 31.2296,
        "image": "https://lh5.googleusercontent.com/p/AF1QipNa-TmkMcnm1cWfjWXXpwt4Pf90Pvx50YrevvUG=w426-h240-k-no",
        "description": "The Qasr El Nil Bridge, also commonly spelled Kasr El Nil Bridge, is a historic structure dating from 1931 which replaced the first bridge to span the Nile River in central Cairo, Egypt. It connects Tahrir Square in downtown Cairo to the modern Cairo Opera complex toward the southern end of Gezira Island.",
        "location": "https://www.google.com/maps/place/Qasr+El+Nil+Bridge/@30.0437555,31.2296361,15z/data=!4m2!3m1!1s0x0:0x514b64de9f412c5?sa=X&ved=2ahUKEwjoupSkluX2AhUXHuwKHfXfBT0Q_BJ6BAgcEAU"
      }
  );
}

Future getAllAttractions() async {

    FirebaseFirestore.instance.collection('tAttraction').get().then((value) {
      value.docs.forEach((element) {
        attractions.add(element.data());
      });
    }).then((value) => print(attractions));

}

Future addToHotels() async {
  int number=20;
  FirebaseFirestore.instance.collection('hotels').doc('$number').set(
      {
        "number": "$number",
        "name": "Aracan pyramids hotel",
        "rating": 3.7,
        "latitude": 29.9958161096,
        "longitude": 31.164641174,
        "image": "https://lh4.googleusercontent.com/proxy/woxTq3s1rIxhdNZpMnmQ90Djcd5eQhUmRG1TzIYDz2cenB-tF_lnGjkVPH_o2daBNdp5lllXKXg_OIbayJtOqhVISrwUQhB2zXN3lPo--0ixf7L1A94r2u-MBEtxdZxlAGsHfdbKO6bY2tk52IvBng8qsNgBSw=w408-h269-k-no",
        "description": "The Rooms are Located in the heart of the Pyramids Road, very close to the Pyramids of Giza, in a commercial area, where shopping, restaurants, all daily life and business facilities are available. All the rooms include fluffy pillows, thick mattresses & cotton-rich linens. All the rooms include fluffy pillows, thick mattresses & cotton-rich linens. High-speed Internet, spacious desks and feature-rich phones allow you to work productively. Superior Pyramids View Rooms & Suites are the ideal choice for long-term stays & family vacations supported with Top VIP Treatment and luxury hotel facilities. Hair Dryer. Electric Shaver Outlet (220V). Satellite LCD TV. Wireless High Speed Internet. Individually Controlled A/C. Mini Fridge. Wake Up Call Phone Service. Digital Safe Box. Bathroom with Standard Amenities (Soap, Shower Gel, Shampoo and Towels). Newspaper (on request). Laundry service. Room Service 24/7.",
        "location": "https://goo.gl/maps/GE5rsPkSgSHCyqS4A"
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
  int number=19;
  FirebaseFirestore.instance.collection('entertainment').doc('$number').set(
      {
        "number": "$number",
        "name": "National Military Museum Egypt",
        "rating": 4.3,
        "latitude": 30.0309273,
        "longitude": 31.262557,
        "image": "https://lh5.googleusercontent.com/p/AF1QipM0qz6VAUolKnQKHRi74snkabt3eSsLfFTz0_He=w408-h271-k-no",
        "description": "The Egyptian National Military Museum is the official museum of the Egyptian Army.",
        "location": "https://www.google.com/maps/place/National+Military+Museum+Egypt/@30.030853,31.262557,15z/data=!4m2!3m1!1s0x0:0x74ce0ab766ad25ad?sa=X&ved=2ahUKEwj7mY7Gz-z3AhUNyKQKHZLqCKAQ_BJ6BAhnEAU"
      }
  );
}

Future getAllEntertainment() async {
  FirebaseFirestore.instance.collection('entertainment').get().then((value) {
    value.docs.forEach((element) {
      entertainment.add(element.data());
    });
  }).then((value) => print(entertainment));
}

