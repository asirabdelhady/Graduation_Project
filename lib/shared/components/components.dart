import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
/////////////////////////////// Shared //////////////////////////////////////////////////

//////////////////////// DetailsScreen///////////////////////////////////////////////////
// Big Title
Widget detailsTitle({required String title}) => Text.rich(TextSpan(
    text: title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)));

//Small title
Widget subTitle({required String subTitle}) => Text.rich(TextSpan(
    text: subTitle,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));

//About section in details screen
Widget aboutDetails({required String details}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(TextSpan(
            text: 'About',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
        SizedBox(
          height: 12,
        ),
        Container(
            height: 70,
            child: Text(
              details,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )),
      ],
    );

// Small images in detail screen
Widget imageComponent({
  required String imagePath,
}) =>
    Container(
        width: 70, //MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(imagePath))));

// Big image in details screen
Widget detailsImage({
  required String imagePath,
}) =>
    ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        child: Image(image: AssetImage(imagePath)));

//Map GestureButton
Widget mapButton() => GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          width: 400,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/Map.jpeg'),
            ),
          ),
        ),
      ),
    );

// Fav and add to tour row
Widget likeAndAddTour({
  favClicked = false,
  required,
}) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              /*setState(() {
                favClicked=!favClicked;
              });*/
            },
            child: Icon(
              (favClicked == false)
                  ? Icons.favorite_border_rounded
                  : Icons.favorite,
              size: 20,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xff292D32),
              shape: CircleBorder(),
            ),
          )),
      Container(
          width: 225,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: Text.rich(TextSpan(
              text: 'Add to Tour',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), primary: Color(0xff292D32)),
          )),
    ]);

//////////////////////// Notification screen///////////////////////////////////////////////////

// Notification container
Widget notificationItem({required String notification}) => Container(
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
              TextSpan(text: notification),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );

Widget slimCardItem({
  required String text,
  required Color color,
  var icon,
  var iconColor,
}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(text: text),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );

Widget buildNotificationItem() => notificationItem(notification: 'Lets go');

////////////////////////  Profile Screen ///////////////////////////////////////////////////

//profile Pic, name, age...
Widget profileHeader({
  required String imagePath,
  required String name,
  required int age,
  required String nationality,
}) =>
    Row(
      children: [
        Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(imagePath)))),
        SizedBox(
          width: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: 104,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text.rich(TextSpan(
                  text: name,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
              Text('Age: $age'),
              Text('Nationality: $nationality')
            ]),
          ),
        )
      ],
    );

// profile tabs: favs, History, Review
Widget profileBody() => DefaultTabController(
    length: 3, // length of tabs
    //initialIndex: 0,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
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
              height: 274, //height of TabBarView
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: TabBarView(children: <Widget>[
                SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 12,
                    ),
                  ]),
                ),
                SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 12,
                    ),
                    slimCardItem(
                        text: 'Any text',
                        icon: Icons.car_rental,
                        iconColor: Colors.black,
                        color: tSecondary())
                  ]),
                ),
                SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 12,
                    ),
                  ]),
                ),
              ])),
        ]));

Widget categorybutton({
  double width = 63,
  double height = 111,
  Color containerColor = const Color(0xffc4c4c4), //bigcylinder
  Color circleColor = const Color(0xFF292D32), //circle
  Color iconColor = Colors.white, //iconColor
  Color textColor = const Color(0xFF292D32), //text
  required String text,
  required IconData iconshape,
  required var ontap,
}) =>
    GestureDetector(
      onTap: ontap,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: containerColor, borderRadius: BorderRadius.circular(50)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 7, 7, 0),
            child: Container(
              width: 50,
              height: 50,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: circleColor),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Icon(
                  iconshape,
                  color: iconColor,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 59,
                child: Center(
                  child: Text(
                    text,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

Widget mainButton({
  required String imagepath,
  required double minWidth,
  required double height,
  double elevation = 25,
  required String text,
  required double fontSize,
  required onPressed,
}) =>
    MaterialButton(
      onPressed: onPressed,
      minWidth: minWidth,
      height: height,
      elevation: elevation,
      color: const Color(0xFFFFFAED),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      child: Container(
        width: 155,
        height: 53,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: const Color(0xFF292D32),
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              imagepath,
              width: 17,
              height: 17,
            )
          ],
        ),
      ),
    );

Widget circleBack({
  required double width,
  required double height,
}) =>
    Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: const Color(0xFFFFFAED), shape: BoxShape.circle),
    );

Widget mainFormField({
  //double width = 276,
  //double height = 49,
  required String hintText,
  required String imagepath,
  required TextInputType,
  required bool passorno,
  var suffixicon = const Icon(Icons.remove_red_eye),
  required var controller,

  required suffixPressed,
  required var onFieldSubmitted,
  required var validatorFunction,
  required var onChanged
}) =>
    Stack(children: [
      Container(
        width: 276,
        height: 49,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
      ),
      Container(
        width: 276,
        height: 71,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            //   SizedBox(height: 1,),
            TextFormField(
              onFieldSubmitted:onFieldSubmitted ,
              validator: validatorFunction,

              controller: controller,


              onChanged: onChanged,

              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset(
                    imagepath,
                    width: 10,
                    height: 10,
                    //    fit: BoxFit.fill,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: suffixPressed,
                  icon: suffixicon,
                ),
              ),
              /*IconButton(icon: suffixicon, onPressed: suffixPressed,),*/
              // border: InputBorder.none,

              keyboardType: TextInputType,
              obscureText: passorno,
            ),
          ],
        ),
      ),
    ]);

Widget categoryCard({
  required double minWidth,
  required double height,
  double elevation = 25,
  required String sightname,
  required onPressed,
  required String imagePath,
}) =>
    Stack(
      children: [
        Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: tPrimary(),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                width: double.infinity,
                height: 243,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: tGrey(),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 30,
                  ),
                  child: Text(
                    sightname,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8, end: 15),
                  child: Container(
                    child: MaterialButton(
                      onPressed: onPressed,
                      minWidth: minWidth,
                      height: height,
                      elevation: elevation,
                      color: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Text(
                        'More',
                        style: TextStyle(
                          color: const Color(0xFF292D32),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );

Widget homeScreenRecommendedCard({
  required String imagePath,
  required double height,
  required double width,
  required onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );

/*class defualtCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    Widget defualtCard({
      required var placeName,
      required var imagePath,
    })=> Stack(
      children: [
        Container(
          height: mediaQueryHeight*0.245,
          width: mediaQueryWidth*0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 25,
            left: 25,
            top: 110,
            bottom: 8,
          ),
          child: Container(
            height: 75,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 20,
                        bottom: 8.0,

                      ),
                      child: Container(
                        width: mediaQueryWidth*0.6875,
                        child: Text(
                          'The Great Pyramids of Giza',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                      ),
                    ),
                  ],),
                Container(
                  width:240 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Icon(Icons.star, color: Colors.yellow,),
                      Text('4.9'),
                      Icon(Icons.access_time, color: Colors.redAccent,),
                      Text('9:00 pm'),
                      Icon(Icons.location_on_rounded, color: Colors.lightBlue,),
                      Text('26 Km'),
                    ],),
                ),
              ],),
          ),
        ),
      ],
    );


    return Stack(
      children: [
        Container(
          height: mediaQueryHeight*0.245,
          width: mediaQueryWidth*0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage('assets/images/Pyramids.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 25,
            left: 25,
            top: 110,
            bottom: 8,
          ),
          child: Container(
            height: 75,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 20,
                        bottom: 8.0,

                      ),
                      child: Container(
                        width: mediaQueryWidth*0.6875,
                        child: Text(
                          'The Great Pyramids of Giza',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold

                          ),
                        ),
                      ),
                    ),
                  ],),
                Container(
                  width:240 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Icon(Icons.star, color: Colors.yellow,),
                      Text('4.9'),
                      Icon(Icons.access_time, color: Colors.redAccent,),
                      Text('9:00 pm'),
                      Icon(Icons.location_on_rounded, color: Colors.lightBlue,),
                      Text('26 Km'),
                    ],),
                ),
              ],),
          ),
        ),
      ],
    );
  }
}*/

Widget defualtCard ({
    required String placeName,
    required String imagePath,
    IconData icon1 = Icons.star,
    IconData icon2 = Icons.access_time,
    IconData icon3 = Icons.location_on_rounded,



})=> Builder(
  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              height: mediaQueryHeight*0.200,
              width: mediaQueryWidth*0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
                left: 13,
                top: 90,
                bottom: 8,
              ),
              child: Container(
                height: mediaQueryHeight*0.122,
                width: mediaQueryWidth*0.781,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            left: 20,
                            bottom: 8.0,

                          ),
                          child: Container(
                            width: mediaQueryWidth*0.6875,
                            child: Text(
                              placeName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold

                              ),
                            ),
                          ),
                        ),
                      ],),
                    Container(
                      width:mediaQueryWidth*0.75 ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                          SizedBox(width: mediaQueryWidth*0.0400,),
                          Row(
                            children: [
                              Icon(icon1, color: Colors.yellow,),
                              Text('4.9'),

                            ],
                          ),
                          SizedBox(width: mediaQueryWidth*0.0375,),
                          Row(
                            children: [
                              Icon(icon3, color: Colors.lightBlue,),
                              Text('26 Km'),

                            ],),
                          SizedBox(width: mediaQueryWidth*0.0375,),

                        ],),
                    ),
                  ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
);