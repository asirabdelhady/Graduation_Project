import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

class NotificationScreen extends StatefulWidget{
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

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
               
                SizedBox(
                  height: mediaQueryHeight,
                  child: ListView.separated(itemBuilder:(context, index)=>Container(

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
                ),

            ]),
          ),
        ),
      ),



    );
  }
  

}

