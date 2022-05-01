import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tour_guide_app/models/models.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
class Utils{
  static List <Notifications> getNotifications(){
    return [
      Notifications(
        notification: "You are 2 Km away from the Pyramids",
        icon: Icon(Icons.notifications_none_rounded),
      ),
      Notifications(
        notification: "You are 3 Km away from the Pyramids",
        icon: Icon(Icons.notifications_none_rounded),
      ),
      Notifications(
        notification: "You are 4 Km away from the Pyramids",
        icon: Icon(Icons.notifications_none_rounded),
      ),
      Notifications(
        notification: "You are 5 Km away from the Pyramids",
        icon: Icon(Icons.notifications_none_rounded),
      ),
      Notifications(
        notification: "You are 6 Km away from the Pyramids",
        icon: Icon(Icons.notifications_none_rounded),
      ),
    ];
  }

  List <Notifications> notifications = Utils.getNotifications();
}

class NotificationScreen extends StatefulWidget{
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}   bool notiPtessed=false;
class _NotificationScreenState extends State<NotificationScreen> {


  int index =3;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title:  Text('Notifications',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: mediaQueryWidth*0.093),),
        backgroundColor: Colors.white,),
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
            child: Column(
              children:[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.03125),
                  width: double.infinity,
                  height: mediaQueryHeight*0.1229,
                  decoration: BoxDecoration(
                    color: notiPtessed==true? tSecondary(): tPrimary(),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    children: [
                      Stack(children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: notiPtessed==true? tPrimary(): Colors.white  ,
                        ),
                        CircleAvatar(
                          backgroundColor:notiPtessed==true? Colors.transparent: Colors.red,
                          radius: 5,
                        ),
                      ],),
                      SizedBox(
                        width: mediaQueryWidth*0.03125,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(text: 'Test notification', ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color:notiPtessed==true? tPrimary(): Colors.white),
                        ),
                      )
                    ],
                  ),
                ),

               /* ListView.builder(
                    itemBuilder: (context, index) {

                })*/


                /*SizedBox(
                  height: mediaQueryHeight,
                  child: 
                  ListView.separated(itemBuilder:(context, index)=>Container(

                    padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0312),
                    width: double.infinity,
                    height: mediaQueryHeight*0.1229,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(7, 5),
                          color: tGrey(),
                        ),
                      ],
                      color: const Color(0xff292D32),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Row(
                      children:  [
                        Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: mediaQueryWidth*0.0375,
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
                    separatorBuilder: (context, index)=>  SizedBox(height: mediaQueryHeight*0.0350,),
                    itemCount: 26,
                  ),
                ),*/

            ]),
          ),
        ),
      ),



    );
  }
}

