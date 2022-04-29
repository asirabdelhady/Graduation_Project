import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';
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
Widget aboutDetails({required String details}) => Builder(
  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return     Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: 'About',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            SizedBox(
              height: mediaQueryHeight*0.019,
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
  }
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
Widget mapButton() => Builder(
  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return     GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              width: mediaQueryWidth*1.25,
              height: mediaQueryHeight*0.163,
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
  }
);

// Fav and add to tour row
Widget likeAndAddTour({
  favClicked = false,
  required,
}) =>
    Builder(
      builder: (context) {
var mediaQueryHeight= MediaQuery.of(context).size.height;
var mediaQueryWidth = MediaQuery.of(context).size.width;
        return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              width: mediaQueryWidth*0.156,
              height: mediaQueryHeight*0.0819,
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
              width: mediaQueryWidth*0.703,
              height: mediaQueryHeight*0.0819,
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
      }
    );

//////////////////////// Notification screen///////////////////////////////////////////////////

// Notification container
Widget notificationItem({required String notification}) => Builder(
  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return     Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: mediaQueryHeight*0.1229,
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
                width: mediaQueryWidth*0.03125,
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
  }
);

Widget slimCardItem({
  required String text,
  required Color color,
  var icon,
  var iconColor,
}) =>
    Builder(
      builder: (context) {
        var mediaQueryHeight= MediaQuery.of(context).size.height;
        var mediaQueryWidth = MediaQuery.of(context).size.width;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: mediaQueryHeight*0.1229,
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
                width: mediaQueryWidth*0.03125,
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
      }
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
    Builder(
      builder: (context) {
        var mediaQueryHeight= MediaQuery.of(context).size.height;
        var mediaQueryWidth = MediaQuery.of(context).size.width;
        return Row(
          children: [
            Container(
                width: mediaQueryWidth*0.325,
                height: mediaQueryHeight*0.170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(imagePath)))),
            SizedBox(
              width: mediaQueryWidth*0.0375,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: mediaQueryHeight*0.170,
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
      }
    );

// profile tabs: favs, History, Review
Widget profileBody() => Builder(
  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return     DefaultTabController(
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
                  height: mediaQueryHeight*0.449, //height of TabBarView
                  decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(children: <Widget>[
                    SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: mediaQueryHeight*0.019,
                        ),
                      ]),
                    ),
                    SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: mediaQueryHeight*0.019,
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
                          height: mediaQueryHeight*0.019,
                        ),
                      ]),
                    ),
                  ])),
            ]));
  }
);

Widget categoryButton({
  Color containerColor = const Color(0xffc4c4c4), //bigcylinder
  Color circleColor = const Color(0xFF292D32), //circle
  Color iconColor = Colors.white, //iconColor
  Color textColor = const Color(0xFF292D32), //text
  required String text,
  required IconData iconShape,
  required var onTap,
}) =>
    Builder(
      builder: (context) {
        var mediaQueryHeight= MediaQuery.of(context).size.height;
        var mediaQueryWidth = MediaQuery.of(context).size.width;
        return GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                width: mediaQueryWidth*0.0196,
                height: mediaQueryHeight*0.181,
                decoration: BoxDecoration(
                    color: containerColor, borderRadius: BorderRadius.circular(50)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(7, 7, 7, 0),
                child: Container(
                  width: mediaQueryWidth*0.156,
                  height: mediaQueryHeight*0.081,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: circleColor),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Icon(
                      iconShape,
                      color: iconColor,
                    ),
                  ),
                  SizedBox(
                    height: mediaQueryHeight*0.040,
                  ),
                  Container(
                    width: mediaQueryWidth*0.18,
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
      }
    );

Widget mainButton({
  required String imagePath,
  required double minWidth,
  required double height,
  double elevation = 25,
  required String text,
  required double fontSize,
  required onPressed,
}) =>
    Builder(
      builder: (context) {
        var mediaQueryHeight= MediaQuery.of(context).size.height;
        var mediaQueryWidth = MediaQuery.of(context).size.width;
        return MaterialButton(
          onPressed: onPressed,
          minWidth: minWidth,
          height: height,
          elevation: elevation,
          color: const Color(0xFFFFFAED),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Container(
            width: mediaQueryWidth*0.484,
            height: mediaQueryHeight*0.086,
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
                  imagePath,
                  width: mediaQueryWidth*0.053,
                  height: 0.0278,
                )
              ],
            ),
          ),
        );
      }
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

   var suffixPressed ,
  required var onFieldSubmitted,
  required var validatorFunction,
  required var onChanged
}) =>
    Builder(
      builder: (context) {
        var mediaQueryHeight= MediaQuery.of(context).size.height;
        var mediaQueryWidth = MediaQuery.of(context).size.width;
        return Stack(children: [
          Container(
            width: mediaQueryWidth*0.862,
            height: mediaQueryHeight*0.080,
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
                 /* IconButton(icon: suffixicon, onPressed: suffixPressed,),
                   border: InputBorder.none,*/

                  keyboardType: TextInputType,
                  obscureText: passorno,
                ),
              ],
            ),
          ),
        ]);
      }
    );

Widget categoryCard({
  required double minWidth,
  required double height,
  double elevation = 25,
  required String sightname,
  required onPressed,
  required String imagePath,
}) =>
    Builder(
      builder: (context) {
        var mediaQueryHeight= MediaQuery.of(context).size.height;
        var mediaQueryWidth = MediaQuery.of(context).size.width;
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: mediaQueryHeight*0.524,
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
                    height: mediaQueryHeight*0.398,
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
      }
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



Widget defualtCard ({
    required String placeName,
    required String imagePath,
    IconData icon1 = Icons.star,
    IconData icon3 = Icons.location_on_rounded,
    // mediaQueryHeight*0.200 + mediaQueryHeight*0.120
    //mediaQueryWidth*0.85+ mediaQueryWidth*0.781



})=> Builder(
  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DetailScreen();
        }));
      },
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
                left: 15,
                top: 90,
                bottom: 8,
              ),
              child: Container(
                height: mediaQueryHeight*0.120,
                width: mediaQueryWidth*0.781,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 5,
                    color: Colors.grey,
                    ),
                  ],
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

Widget backButton()=> Builder(

  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return     Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaQueryWidth*0.156,
        height: mediaQueryHeight*0.081,
        child: ElevatedButton(
          onPressed: () {
          Navigator.pop(context);
        },
    style: ElevatedButton.styleFrom(
    primary: tPrimary(),
    shape: CircleBorder(),

    ),
    child: Icon(Icons.arrow_back_rounded,
            color: Colors.white,
        ),
    ),
      )
    );

  }
);

Widget cardBuilderWithDotIndicator ()=> Builder(
  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    PageController pageController = PageController(initialPage: 0);
    Widget _buildPageItem(int index) {
      return defualtCard(placeName: 'Pyramids', imagePath: 'assets/images/Pyramids.jpg');
    }
    return     Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              height: mediaQueryHeight*0.322,
              width: mediaQueryWidth,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) => _buildPageItem(position),
                itemCount: 3,
                controller: pageController,
              )
          ),
        ),
        Center(
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: WormEffect(
              dotColor: tGrey(),
              activeDotColor: tPrimary(),
            ),
          ),
        ),
      ],
    );
  }
);

Widget stepperCard ({
  required String placeName,
  required String imagePath,
  IconData icon1 = Icons.star,
  IconData icon3 = Icons.location_on_rounded,
  // mediaQueryHeight*0.200 + mediaQueryHeight*0.120
  //mediaQueryWidth*0.85+ mediaQueryWidth*0.781



})=> Builder(
    builder: (context) {
      var mediaQueryHeight= MediaQuery.of(context).size.height;
      var mediaQueryWidth = MediaQuery.of(context).size.width;
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DetailScreen();
          }));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                height: mediaQueryHeight*0.200,
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
                  left: 15,
                  top: 90,
                  bottom: 8,
                ),
                child: Container(
                  height: 100,
                  width: 230,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 5,
                        color: Colors.grey,
                      ),
                    ],
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
                              width: 150,
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
