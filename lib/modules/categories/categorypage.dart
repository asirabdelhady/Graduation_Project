
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/shared/components/components.dart';


class categorypage extends StatefulWidget {
  @override
  State<categorypage> createState() => _categorypageState();
}

class _categorypageState extends State<categorypage> {

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Row(
          children:
          [
            SizedBox(height: 150,),
            IconButton(
                onPressed: (){},
                icon:CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.cloud_outlined,
                    color: Colors.white,
                    size: 17,
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
      extendBody: true,
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
                    Text('Category',
                      style: TextStyle(
                        fontSize: 36,
                        color: navyBlue(),
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 12),
                      child: Text('Pyramdis',
                        style: TextStyle(
                          fontSize: 16,
                          color: grey(),
                        ),
                      ),
                    ),

                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                    [
                      categoryButton(text: 'all', iconshape: Icons.add),
                      SizedBox(width: 10,),
                      categoryButton(text: 'music', iconshape: Icons.music_note),



                    ],
                  ),
                ),
                SizedBox(height: 16,),
                SingleChildScrollView(
                  child:
                  Column(
                    children: [
                      categoryCard(minWidth: 101, height: 37, sightname: 'Pyramids', onPressed: (){}),
                      SizedBox(height: 10,),
                      categoryCard(minWidth: 101, height: 37, sightname: 'Cairo Tower', onPressed: (){}),
                      SizedBox(height: 66,),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 55.0,
        items: <Widget>[
          Icon(Icons.add, size: 30,color: Colors.white,),
          Icon(Icons.list, size: 30,color: Colors.white),
          Icon(Icons.perm_identity, size: 30,color: Colors.white),
        ],
        color: navyBlue(),
        buttonBackgroundColor: grey(),
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
