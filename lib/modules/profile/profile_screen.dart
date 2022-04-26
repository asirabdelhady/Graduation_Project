import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tour_guide_app/modules/notification/notification_screen.dart';

class ProfileScreen extends StatefulWidget{
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationPressed = false;
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));
                  },
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
        extendBody: true,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(children:[
              Row(
                children:[ Text.rich(TextSpan(text: 'Profile',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 30)
                )
                ),
                 Expanded(child:
                     Container()
                 ),
                  Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(),
                    ),
                      child: IconButton(icon: Icon(Icons.edit_outlined), onPressed: (){})),
              ]),
              SizedBox(height: 12),
              Center(
                child: Row(
                  children: [
                    Container(
                      width: 104,
                        height: 104,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image:  AssetImage('assets/images/Pyramids1.jpg')
                            )
                        )
                    ),
                    SizedBox(width: 12,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Container(
                        height: 104,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[ Text.rich(TextSpan(
                            text: 'Asir Abdelhady',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold
                            )
                          )),
                        Text('Age: 22'),
                            Text('Nationality: Egypt')

                          ]),
                      ),
                    )
                  ],
                ),
              ),
              DefaultTabController(
                  length: 3, // length of tabs
                  //initialIndex: 0,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children:<Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Color(0xff292D32),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: 'Favorites'),
                          Tab(text: 'History'),
                          Tab(text: 'Review'),

                        ],
                      ),
                    ),
                     Container(
                          height: 274,//height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                            ),
                            child: TabBarView(children: <Widget>[
                              SingleChildScrollView(
                                child: Column(
                                  children:[
                                    SizedBox(height: 12,),

                                ]),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                    children:[
                                      SizedBox(height: 12,),

                                    ]),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                    children:[
                                      SizedBox(height: 12,),

                                    ]),
                              ),
                            ])
                        ),


                  ])
              ),

            ]),
          ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home_rounded, size: 30,color: Colors.white,),
          Icon(Icons.list, size: 30,color: Colors.white),
          Icon(Icons.perm_identity, size: 30,color: Colors.white),
        ],
        color: Color(0xff292D32),
        buttonBackgroundColor: Colors.grey,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 250),
        onTap: (index) {

        },
      ),
      );
  }
}
