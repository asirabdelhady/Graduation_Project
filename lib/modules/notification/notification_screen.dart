import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tour_guide_app/models/models.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

class Utils {
  static List<Notifications> getNotifications() {
    return [
      Notifications(
        notification: "You are 2 Km away from the Pyramids",
      ),
      Notifications(
        notification: "You are 3 Km away from the Pyramids",
      ),
      Notifications(
        notification: "You are 4 Km away from the Pyramids",
      ),
      Notifications(
        notification: "You are 5 Km away from the Pyramids",
      ),
      Notifications(
        notification: "You are 6 Km away from the Pyramids",
      ),
      Notifications(
        notification: "You are 2 Km away from the Pyramids",
      ),
      Notifications(
        notification: "You are 3 Km away from the Pyramids",
      ),
      Notifications(
        notification: "You are 4 Km away from the Pyramids",
      ),
      Notifications(
        notification: "You are 5 Km away from the Pyramids",
      ),
      Notifications(
        notification: "You are 6 Km away from the Pyramids",
      ),
    ];
  }
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

bool notiTapped = false;

class _NotificationScreenState extends State<NotificationScreen> {
  List<Notifications> notifications = Utils.getNotifications();

  int index = 3;
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //extendBody: true,
      body: Stack(
        children: [
          Container(
            height: mediaQueryHeight,
            width: mediaQueryWidth,
            child: Image.asset('assets/images/application background.png',
              fit: BoxFit.cover,),

          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  defaultTitle(title: 'Notification', fontWeight: FontWeight.bold),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: mediaQueryWidth * 0.025),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: tPrimary(),
                      ),
                      child: Text('Read All'),
                      onPressed: () {
                        setState(() {
                          notiTapped = true;
                        });
                      },
                    ),
                  ),
                ]),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQueryWidth * 0.0375),
                    child: Column(children: [
                      SizedBox(
                        height: mediaQueryHeight * 0.0196,
                      ),
                      Container(
                        width: mediaQueryWidth,
                        height: mediaQueryHeight * 0.819,
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: mediaQueryHeight * 0.0196,
                                ),
                            itemCount: notifications.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                key: Key(notifications[index].notification),
                                onDismissed: (direction) {
                                  setState(() {
                                    notifications.removeAt(index);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mediaQueryWidth * 0.03125),
                                  width: double.infinity,
                                  height: mediaQueryHeight * 0.1229,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: tGrey(),
                                        offset: Offset(0, 6),
                                        blurRadius: 3,
                                      ),
                                    ],
                                    color: notiTapped == true
                                        ? tGrey()
                                        : tPrimary(),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Icon(
                                            Icons.notifications_none_rounded,
                                            color: notiTapped == true
                                                ? tPrimary()
                                                : Colors.white,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: notiTapped == true
                                                ? Colors.transparent
                                                : Colors.red,
                                            radius: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: mediaQueryWidth * 0.03125,
                                      ),
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(
                                            text: notifications[index]
                                                .notification,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: notiTapped == true
                                                  ? tPrimary()
                                                  : Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/* Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            defaultTitle(title: 'Tour Plan', fontWeight: FontWeight.bold),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.025),
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: tPrimary(),
                ),
                child: Text('Read All'),
                onPressed :(){
                  setState(() {
                    notiTapped=true;
                  });
                },
              ),
            ),
          ]),*/
/*appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.025),
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: tPrimary(),
              ),
              child: Text('Read All'),
              onPressed :(){
                setState(() {
                  notiTapped=true;
                });
              },
            ),
          ),
        ],
        title:  Text('Notifications',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: mediaQueryWidth*0.093),),
        backgroundColor: Colors.white,),*/
