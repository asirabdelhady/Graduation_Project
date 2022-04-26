import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/components/components.dart';

class NotificationScreen extends StatefulWidget{
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int index =3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 30),),
        backgroundColor: Colors.white,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const SizedBox(height: 12,),
                SizedBox(
                  height: 75,
                  child: ListView.separated(itemBuilder:(context, index)=>Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xff292D32),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Row(
                      children: const [
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
                    separatorBuilder: (context, index)=> const SizedBox(height: 15,),
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



    );
  }
  

}

