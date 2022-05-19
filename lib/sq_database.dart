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
    createDatabase();
  }

  void createDatabase() async{
     database = await openDatabase(
      'tourGuideDB3.db',
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
        /*getDataFromDatabase(database).then((value) {
          tAttractions=value;
          print(tAttractions);
        });*/
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
      description ) VALUES(
      "Museum of Islamic Art", 
      "30.0447", 
      "31.2527",
      "assets/images/Museum of Islamic Art.jpg", 
      "4.7" ,
      "20km",
      "https://www.google.com/maps/place/Museum+of+Islamic+Art,+Cairo/@30.0447243,31.2505325,17z/data=!3m1!4b1!4m5!3m4!1s0x14583f7d6211c891:0xad7d1092373bae8b!8m2!3d30.0447197!4d31.2527212",
      "Opposite to the Cairo Governorate Office, at the intersection of Port Said and Mohamed Ali streets, is the magnificent building of the Museum of Islamic Art (MIA). The place is a must visit if you are planning to travel to Cairo. The reason behind this is the overwhelming architecture of the building and divine historical artefacts housed by the Museum."
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
    database.rawDelete('DELETE FROM tAttractions WHERE id = 1').then((value) =>
        print('row deleted')).catchError((error)=> print('error when deleting row: $error'));
  }
  void dropTable(){
    database.rawQuery('DROP TABLE tAttractions');
  }
  void updateRow(){
    database.rawQuery('UPDATE tAttractions SET rating = "4.5", WHERE id = 10' );

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
              updateRow();
            },
                child: Text('update')),
            ElevatedButton(onPressed: (){
              dropTable();
            },
                child: Text('delete row')),
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