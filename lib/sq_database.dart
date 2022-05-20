import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/components/constants.dart';

class TestingDatabse extends StatefulWidget{
  const TestingDatabse({Key? key}) : super(key: key);

  @override
  State<TestingDatabse> createState() => _TestingDatabseState();
}

class _TestingDatabseState extends State<TestingDatabse> {


  late Database database;

  @override
  void initState() {
    super.initState();
    createDatabase().then((value) {
      setState(() {
      });
    });

  }

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
          tAttractions=value;
          print(tAttractions);
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
  }



  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            ElevatedButton(onPressed: (){
              insertToDatabase();
              setState(() {

              });
            },
                child: Text('insert to database')),
            ElevatedButton(onPressed: (){
              getDataFromDatabase(database).then((value) {
                tAttractions=value;
                print(tAttractions);
              });
            },
                child: Text('print')),
            ElevatedButton(onPressed: (){
              deleteRow();
            },
                child: Text('delete row')),
            ElevatedButton(onPressed: (){
              setState(() {

              });
            },
                child: Text('set State')),
            ElevatedButton(onPressed: (){
              updateRow();
            },
                child: Text('update')),
            ElevatedButton(onPressed: (){
              dropTable();
            },
                child: Text('drop table')),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  height: mediaQueryHeight*0.322,
                  width: mediaQueryWidth,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => defualtCard(tAttractions[index]),
                    itemCount: tAttractions.length,
                  )
              ),
            )
          ],),
        ),
      ),
    );
  }
}