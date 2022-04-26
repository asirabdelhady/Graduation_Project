
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tour_guide_app/shared/components/components.dart';





class homescreen extends StatefulWidget {
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0.0,
        title: Row(
          children:
          [
            IconButton(
                onPressed: (){},
                icon:CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.cloud_outlined,
                    color: Colors.white,
                    size: 15,
                  ),
                )

            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child:
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(10),

                ),


                height: 26,
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.location_on_outlined,
                      color: Colors.black,
                      size: 17,

                    ),
                  ),
                ),
              ),

            ),
            SizedBox(
              width: 15,
            ),
            IconButton(
                onPressed: (){},
                icon:CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 15,
                  ),
                )

            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0,vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children:
              [
                Row(
                  children:
                  [
                    Expanded(
                      child:
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(20),

                        ),


                        height: 47,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Icon(Icons.search,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                SizedBox(width: 5,),
                                Text('Search',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ),

                  ],
                ),
                SizedBox(height: 24,
                ),
                Row(
                  children:
                  [
                    Expanded(
                      child:
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(20),

                        ),


                        height: 150,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Icon(Icons.search,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                SizedBox(width: 5,),
                                Text('Search',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 24,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                    [
                      categoryButton(
                        text: 'all', iconshape: Icons.plus_one_sharp
                      ),
                      SizedBox(width: 10,),
                      categoryButton(text: 'music',iconshape: Icons.music_note_outlined),


                    ],
                  ),
                ),
                SizedBox(height: 24,
                ),
                Row(
                  children:
                  [
                    Text('Recommended',
                      style: TextStyle(
                        fontSize: 16,

                      ),),
                  ],
                ),
                SizedBox(height: 24,
                ),
                Row(
                  children:
                  [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          image:DecorationImage(

                            image: NetworkImage('https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/39/9d/32.jpg',),
                            fit: BoxFit.fill,
                          ),

                        ),
                        height: 150,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          image:DecorationImage(

                            image: NetworkImage('https://mlrhpz8jmuut.i.optimole.com/BDSiYJw-s4o_NhSn/w:710/h:707/q:85/https://egypttoursplus.com/wp-content/uploads/2014/03/Cairo-Tower-seen-from-the-Nile-River.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),

                        ),
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.add, size: 30,color: Colors.white,),
          Icon(Icons.list, size: 30,color: Colors.white),
          Icon(Icons.perm_identity, size: 30,color: Colors.white),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.grey,
        backgroundColor: Colors.red.withOpacity(0),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),

    );

  }

}
void createDatabase() async{

  var database = await openDatabase(
    'tourGuide.db',
      version: 1,
      onCreate: (database, version){
      print('database created');
      },
    onOpen: (database){
      print('database opened');
    }
  );
}

void insertToDatabase(){

}
