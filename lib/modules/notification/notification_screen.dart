import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/modules/profile/profile_screen.dart';
import 'package:tour_guide_app/shared/components/components.dart';

class NotificationScreen extends StatefulWidget{
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
              child:
              ElevatedButton(onPressed: (){},
                child: Icon(Icons.notifications_none, size: 30, color: Colors.white,),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff292D32), shape: const CircleBorder()
                ),)
          ),
        ),

        ],
        title: Text.rich(TextSpan(text: 'Notifications'),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
      ),
      extendBody: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
                const SizedBox(height: 12,),
                SizedBox(
                  height: 75,
                  child: ListView.separated(itemBuilder:(context, index)=>Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 75,
                    decoration: BoxDecoration(
                      color: Color(0xff292D32),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(text: 'notification'),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                    separatorBuilder: (context, index)=> SizedBox(height: 15,),
                    itemCount: 6,
                  ),
                ),
                const SizedBox(height: 12,),
                notificationItem(notification: 'Hey! your 5 KM away from the pyramids'),
                const SizedBox(height: 12,),
                notificationItem(notification: 'You are mins away from your destination lets go lets go'),
                const SizedBox(height: 12,),
                notificationItem(notification: 'You are mins away from your destination lets go lets go'),
                const SizedBox(height: 12,),
                notificationItem(notification: 'You are mins away from your destination lets go lets go'),
                const SizedBox(height: 12,),
                notificationItem(notification: 'You are mins away from your destination lets go lets go'),
                const SizedBox(height: 12,),
                notificationItem(notification: 'You are mins away from your destination lets go lets go'),
                const SizedBox(height: 12,),
                notificationItem(notification: 'You are mins away from your destination lets go lets go'),

            ]),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home_rounded, size: 30,color: Colors.white,),
          Icon(Icons.list, size: 30,color: Colors.white),
          IconButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
          },
              icon: Icon(Icons.perm_identity, size: 30,color: Colors.white)),
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

