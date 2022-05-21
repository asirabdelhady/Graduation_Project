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

  @override
  void dispose() {
    super.dispose();
    database.close();
  }



  Future createDatabase() async{
     database = await openDatabase(
      'tourGuideDB.db',
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
"Al-Azhar Mosque", 
"30.0457", 
"31.2627",
"assets/images/Al-Azhar Mosque.jpg", 
"4.6" ,
"20 KM ",
"https://www.google.com/maps/place/Al-Azhar+Mosque/@30.0456926,31.2604964,17z/data=!3m1!4b1!4m5!3m4!1s0x145840a2f3fd21f5:0x676752c74b1e52e8!8m2!3d30.045688!4d31.2626851",
"Al-Azhar Mosque is right in the centre of the downtown area and in addition to being a mosque, it is one of the oldest universities in the world. The spectacular landmark has a huge primary gateway allowing visitors to enter inside and explore the stunning architecture of this marvel. The five minarets of the mosque can be clearly seen and felt. Visitors often sit inside and pray in the central hall to get some respite from the outer busy world."
)     
      ''')
          .then((value) => print('$value inserted successfully'))
          .catchError((e)=> print('error when inserting data: $e'));

    });
  }

  Future<List<Map>> getDataFromDatabase(database)async{
    return await database.rawQuery('SELECT * FROM tAttractions');
  }
  
  void deleteRow(String sql){
    database.rawDelete(sql).then((value) =>
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


  Future closeDatabase() async{
    await database.close().then((value) => print('database closed'));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                  print(tAttractions.length);
                });
              },
                  child: Text('print')),
              ElevatedButton(onPressed: (){
                deleteRow('DELETE FROM tAttractions WHERE id = 1');
              },
                  child: Text('delete row')),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              },
                  child: Text('set State')),
              ElevatedButton(onPressed: () {
                setState(() {
                  closeDatabase().then((value) => print('database closed'));
                });
              },
                  child: Text('close database')),
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
              ),
              /*Container(
                width: double.infinity,
                height: 300,
                child: PageView.builder(
                  itemCount: 3,
                    itemBuilder: (context, index) => defualtCard(tAttractions1[index]),

                )
              ),*/
            ],),
          ),
        ),
      ),
    );
  }
}