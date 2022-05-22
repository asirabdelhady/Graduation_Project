import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sqflite/sqflite.dart';

List attractions=[];

List hotels=[];

List entertainment=[];

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
/*

late Database database;

Future createDatabase() async{
  database = await openDatabase(
      'tourGuideDB4.db',
      version: 1,
      onCreate: (database, version) async{
        print('database created');
        await database.execute(
            'CREATE TABLE tAttractions (id INTEGER PRIMARY KEY, name TEXT, latitude INTEGER, longitude INTEGER ,image TEXT ,rating INTEGER ,distance TEXT ,googleMapLocation TEXT ,description TEXT)')
            .then((value) => print('table created'))
            .catchError((error)=> print('error when creating database: $error'));
      },


      onOpen: (database){
        print('database opened');
        getDataFromDatabase(database).then((value) {
          attractions=value ;
          print(attractions);
        });
      }
  );
}

void insertToDatabase(){
  database.transaction((txn) async {

    await txn.rawInsert('''
      INSERT INTO tAttractions (
name , 
latitude , 
longitude ,
image ,
rating , 
distance,
googleMapLocation ,
description ) 
VALUES(
"Wadi El Rayan", 
"29.1909", 
"30.4012",
"assets/images/Wadi El Rayan.jpg", 
"4.6" ,
"37 KM ",
"https://www.google.com/maps/place/Wadi+El+Rayan/@29.1907185,30.3659211,12z/data=!3m1!4b1!4m5!3m4!1s0x145bef777593e399:0x42b67909acc99ad8!8m2!3d29.1908915!4d30.4011911?hl=en",
"Wadi El-Rayan is a natural depression in the western desert of Egypt, 42m below the sea level. It consists of two lakes connected by Egypt's only waterfall. It was designated as a Protected Area in 1989 to protect the area's biological, geological and cultural resources. The Protected Area covers 1759 km2 in the southern part of El-Fayoum."
)     
      ''')
        .then((value) => print('$value inserted successfully'))
        .catchError((e)=> print('error when inserting data: $e'));

  });
}

Future<List<Map>> getDataFromDatabase(database)async{
  return await database.rawQuery('SELECT * FROM tAttractions');
}

void deleteRow(){
  database.rawDelete('DELETE FROM tAttractions WHERE id = 3').then((value) =>
      print('row deleted')).catchError((error)=> print('error when deleting row: $error'));
}
void dropTable(){
  database.rawQuery('DROP TABLE tAttractions');
}
void updateRow(){
  database.rawQuery('UPDATE tAttractions SET rating = "4.5", WHERE id = 10' );

}

void insertElement(){
  database.rawQuery('sql');
}*/
