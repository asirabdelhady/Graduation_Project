import 'dart:html';

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
Widget imageComponent({required String imagePath,}) => Container(
        width: 70, //MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(imagePath))));

// Big image in details screen
Widget detailsImage({required String imagePath,}) => ClipRRect(
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
   favClicked =false,
  required ,
}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              /*setState(() {
                favClicked=!favClicked;
              });*/
            },
            child: Icon((favClicked==false)? Icons.favorite_border_rounded : Icons.favorite ,
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
              style: TextStyle(
                  color: Colors.white, fontSize: 20),
            )),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Color(0xff292D32)),
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
    var color,
    var  icon,
    var iconColor,

}) => Container(
  padding: EdgeInsets.symmetric(horizontal: 10),
  width: double.infinity,
  height: 75,
  decoration: BoxDecoration(
    color: iconColor,
    borderRadius: BorderRadius.circular(35),
  ),
  child: Row(
    children: [
      Icon(
        icon,
        color: color,
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


Widget buildNotificationItem()=> notificationItem(notification: 'Lets go');



////////////////////////  Profile Screen ///////////////////////////////////////////////////

//profile Pic, name, age...
Widget profileHeader({
  required String imagePath,
  required String name,
  required String age,
  required String nationality,
}) => Row(
  children: [
    Container(
        width: 104,
        height: 104,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage(imagePath)
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
                text: name,
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                )
            )),
              Text(age),
              Text(nationality)

            ]),
      ),
    )
  ],
);

// profile tabs: favs, History, Review
Widget profileBody() => DefaultTabController(
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
);


Widget categoryButton({
  double width=63,
  double height=111,
  Color containerColor=Colors.grey,
  Color circleColor=const Color(0xFF292D32),
  Color iconColor=Colors.white,
  Color textColor=const Color(0xFF292D32),
  required String text,
  required IconData iconshape,
})=>GestureDetector(
  onTap: (){


  },
  child:   Stack(

    children:

    [

      Container(

        width: width,

        height: height,

        decoration: BoxDecoration(

            color:containerColor,

            borderRadius: BorderRadius.circular(50)

        ),

      ),

      Padding(
        padding: const EdgeInsets.fromLTRB(7, 7, 7,0),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor
          ),
        ),
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Icon(iconshape,
              color: iconColor,),
          ),
          SizedBox(height: 30 ,),
          Text(text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],

  ),
);

Widget mainButton({

  required double minWidth,
  required double height,
  double elevation=25,
  required String text,
  required double fontSize,
  required onPressed,
})=>MaterialButton(onPressed:onPressed,
  minWidth: minWidth,
  height: height,
  elevation: elevation,
  color:const Color (0xFFFFFAED),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
  child: Text(text,
    style: TextStyle(
      color: const Color(0xFF292D32),
      fontSize: 18,
    ),),


);

Widget circleBack({
  required double width,
  required double height,
})=> Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
      color:const Color(0xFFFFFAED),
      shape: BoxShape.circle
  ),
);

Widget mainFormField({
  double width =276,
  double height=49,
  required String hintText,
  required Icon iconPrefix,

})=>Container(
  width: 276,
  height: 49,
  decoration:  BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: Colors.white,
  ),
  child:
  TextField(
    decoration:  InputDecoration(
      hintText: hintText,
      prefixIcon: iconPrefix,
      border: InputBorder.none,

    ),
  ),
);


Widget categoryCard({
  required double minWidth,
  required double height,
  double elevation=25,
  required String sightname,
  required onPressed,
})=>Stack(
  children:
  [
    Container(
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(30),
        color: navyBlue(),
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
              borderRadius:BorderRadius.circular(30),
              color: grey(),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 30,),
              child: Text(sightname
                ,style: TextStyle(fontSize: 20,color: Colors.white),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 8,end: 15),
              child: Container(
                child: MaterialButton(onPressed:onPressed,
                  minWidth: minWidth,
                  height: height,
                  elevation: elevation,
                  color:const Color (0xFFFFFFFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: Text('More',
                    style: TextStyle(
                      color: const Color(0xFF292D32),
                      fontSize: 18,
                    ),),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  ],
);



