import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/modules/categories/category_screen.dart';
import 'package:tour_guide_app/modules/home/homescreen.dart';
import 'package:tour_guide_app/shared/components/constants.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:expandable_text/expandable_text.dart';
import '../../utils.dart';

/////////////////////////////// Shared //////////////////////////////////////////////////

//////////////////////// DetailsScreen///////////////////////////////////////////////////
// Big Title
Widget defaultTitle({
  required String title,
  var fontWeight}) => Text.rich(TextSpan(
    text: title, style: TextStyle(fontWeight:fontWeight, fontSize: 35)));

//Small title
Widget subTitle({required String subTitle}) => Text.rich(TextSpan(
    text: subTitle,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));

//About section in details screen
Widget aboutDetails({required String details}) => Builder(
  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    double textHeight=70;
    return     Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text.rich(TextSpan(
                text: 'About',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            SizedBox(
              height: mediaQueryHeight*0.019,
            ),
            ExpandableText(

              details,
              maxLines: 4,
              expandText: 'more',
              collapseText: 'less',
              animation: true,
              collapseOnTextTap: true,



            ),
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
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
        child: Image(image: AssetImage(imagePath)));

//Map GestureButton
Widget mapButton(Map model) => Builder(
  builder: (context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return     GestureDetector(
          onTap: () {
            model['googleMapLocation'];
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              width: mediaQueryWidth*1.25,
              height: mediaQueryHeight*0.163,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/Map.jpeg'),
                ),
              ),
            ),
          ),
        );
  }
);

////////////////////////  Profile Screen ///////////////////////////////////////////////////

//profile Pic, name, age...
Widget profileHeader({
  required String imagePath,
  required String name,
  required int age,

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
              child: SizedBox(
                width: mediaQueryWidth,
                height: mediaQueryHeight*0.170,
                child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                  Text.rich(TextSpan(
                      text: name,
                      style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
                  Text('Age: $age'),

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

    final Stream<QuerySnapshot> favorites = FirebaseFirestore.instance.collection('favorites').snapshots();
    final Stream<QuerySnapshot> history = FirebaseFirestore.instance.collection('history').snapshots();

    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 2, // length of tabs
        child: SafeArea(
          bottom: false,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: const TabBar(
                    labelColor: Color(0xff292D32),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Favorites'),
                      Tab(text: 'History'),
                    ],
                  ),
                ),
                Container(
                    height: mediaQueryHeight*0.536, //height of TabBarView
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                    child: TabBarView(children: <Widget>[
                      SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: mediaQueryHeight*0.019,
                          ),
                          SizedBox(
                            width: mediaQueryWidth,
                            height: mediaQueryHeight*0.536, //height of TabBarView
                            child: StreamBuilder(
                              stream: favorites ,
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot){
                                if (snapshot.hasError){
                                  return const Text('Something went wrong');
                                }
                                if(snapshot.connectionState==ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator());
                                }
                                final data = snapshot.requireData;
                                return SizedBox(
                                  width: mediaQueryWidth,
                                  height: mediaQueryHeight*0.320,
                                  child: ListView.builder(
                                      itemCount: data.size,
                                      itemBuilder:(context, index) {
                                        return tourPlanCard2(
                                          name: data.docs[index]["name"],
                                          image: data.docs[index]["image"],
                                          description: data.docs[index]["description"],
                                        ) ;
                                      }),
                                );
                              },
                            ),
                          ),
                        ]),
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: mediaQueryHeight*0.019,

                          ),
                          SizedBox(
                            width: mediaQueryWidth,
                            height: mediaQueryHeight*0.536, //height of TabBarView
                            child:StreamBuilder(
                              stream: history ,
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot){
                                if (snapshot.hasError){
                                  return const Text('somthing went wrong');
                                }
                                if(snapshot.connectionState==ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator());
                                }
                                final data = snapshot.requireData;
                                return SizedBox(
                                  width: mediaQueryWidth,
                                  height: mediaQueryHeight*0.320,
                                  child: ListView.builder(
                                      itemCount: data.size,
                                      itemBuilder:(context, index) {
                                        return tourPlanCard2(
                                          name: data.docs[index]["name"],
                                          image: data.docs[index]["image"],
                                          description: data.docs[index]["description"],
                                        ) ;
                                      }),
                                );
                              },
                            ),
                          ),
                        ]),
                      ),
                    ])),
              ]),
        ));
  }
);


Widget mainButton({
  required String imagePath,
  required double minWidth,
  required double height,
  double elevation = 15,
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
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: SizedBox(
              width: mediaQueryWidth*0.5,
              height: mediaQueryHeight*0.039,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: const Color(0xFF292D32),
                      fontSize: mediaQueryWidth*0.05,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    imagePath,
                    width: mediaQueryWidth*0.05,
                    height: mediaQueryHeight*0.026,
                  )
                ],
              ),
            ),
          );
        }
    );

Widget mainFormField({
  required String hintText,
  String? imagepath,
  required TextInputType,
  required bool passorno,
  var suffixicon = const Icon(Icons.remove_red_eye),
  required var controller,
  var suffixPressed ,
  required var onFieldSubmitted,
  required var validatorFunction,
  required var onChanged,
  enable=null
}) =>
    Builder(
        builder: (context) {
          var mediaQueryHeight= MediaQuery.of(context).size.height;
          var mediaQueryWidth = MediaQuery.of(context).size.width;
          return Stack(children: [
            Container(
              width: mediaQueryWidth*0.775,
              height: mediaQueryHeight*0.066,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
            ),
            Container(
              width: mediaQueryWidth*0.766,
              height: mediaQueryHeight*0.115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  TextFormField(
                    enabled: enable,
                    onFieldSubmitted:onFieldSubmitted ,
                    validator: validatorFunction,
                    controller: controller,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.043, vertical: mediaQueryHeight*0.0229),
                        child: Image.asset(
                          imagepath!,
                          width: mediaQueryWidth*0.0312,
                          height: mediaQueryHeight*0.016,
                          //    fit: BoxFit.fill,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: suffixPressed,
                        icon: suffixicon,
                        iconSize: 19,
                      ),
                    ),
                    keyboardType: TextInputType,
                    obscureText: passorno,
                  ),
                ],
              ),
            ),
          ]);
        }
    );

Widget tourPlanCard1({
  required String name,
  required String image,
   double? rating,
   String? distance,
   String? location,
   String? description,
   double? latitude,
   double? longitude,

}) =>
    Builder(
        builder: (context) {
          var mediaQueryHeight= MediaQuery.of(context).size.height;
          var mediaQueryWidth = MediaQuery.of(context).size.width;
          return GestureDetector(
            onTap:(){
              showDialog(context: context,
                builder: (_)=> Dialog(
                    child: SingleChildScrollView(
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: mediaQueryWidth,
                              height: mediaQueryHeight*0.227,
                              child:ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)
                                  ),
                                  child: Image(image: NetworkImage('$image'),
                                    fit: BoxFit.fill,)),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375, vertical: mediaQueryHeight*0.01311),
                              child: CircleAvatar(
                                radius: 22.5,
                                backgroundColor: tPrimary(),
                                child: IconButton(onPressed: () {
                                  Navigator.pop(context);
                                }, icon: const Icon(Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$name',
                                style: const TextStyle(fontSize: 33),),
                              SizedBox(height: mediaQueryHeight*0.019,),
                              aboutDetails(details: '$description'),
                              SizedBox(
                                height: mediaQueryHeight*0.019,
                              ),
                              GestureDetector(
                                onTap: () {
                                  location;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Container(
                                    width: mediaQueryWidth*1.25,
                                    height: mediaQueryHeight*0.163,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: const DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage('assets/images/Map.jpeg'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: mediaQueryHeight*0.019,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(

                                        width: mediaQueryWidth*0.550,
                                        height: mediaQueryHeight*0.081,

                                        child: ElevatedButton(
                                          onPressed: () {
                                            /*addToFavorites(
                                                name: '$name',
                                                image: '$image',
                                                location: '$location',
                                                distance: '$distance',
                                                description: '$description',
                                                latitude: '$latitude',
                                                longitude: '$longitude'
                                            )*/;

                                          },
                                          child: Text.rich(TextSpan(
                                            text: 'Add to Favorites',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: mediaQueryWidth*0.0525),
                                          )),
                                          style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              primary: const Color(0xff292D32)
                                          ),
                                        )
                                    ),
                                  ]),
                              SizedBox(height: mediaQueryHeight*0.019,),
                            ],
                          ),
                        )

                      ],),
                    )
                ),
              );
            } ,
            child: Stack(
              children: [
                Container(

                  width: mediaQueryWidth*0.916,
                  height: mediaQueryHeight*0.159,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mediaQueryWidth*0.083),
                    color: tSecondary(),
                    boxShadow: [
                      BoxShadow(
                        color: tGrey(),
                        offset: const Offset(5, 5),
                        blurRadius: 3,

                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: mediaQueryHeight*0.037,left: mediaQueryWidth*0.027),
                      child: Container(
                        width: mediaQueryWidth*0.277,
                        height: mediaQueryHeight*0.132,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(mediaQueryWidth*0.083),
                          color: tGrey(),
                          image: DecorationImage(
                            image: NetworkImage('$image'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: mediaQueryHeight*0.186,
                          width: mediaQueryWidth*0.555,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: mediaQueryHeight*0.01311),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: mediaQueryWidth*0.486,
                                  height: mediaQueryHeight*0.066,
                                  child: Text(
                                    '$name',
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 16, color: tPrimary(),),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: mediaQueryWidth*0.286,),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(top: mediaQueryHeight*0.0100, end: mediaQueryWidth*0.0468),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(mediaQueryWidth*0.083)
                                        ),
                                        width: mediaQueryWidth*0.222,
                                        height: mediaQueryHeight*0.060,
                                        child: MaterialButton(
                                          onPressed:  (){
                                            addToHistory(
                                                name: '$name',
                                                image: '$image',
                                                location: '$location',
                                                distance: '$distance',
                                                description: '$description',
                                                latitude: '$latitude',
                                                longitude: '$longitude'
                                            );
                                            var doc =FirebaseFirestore.instance.collection('tour').where('name'==name).get();

                                          },
                                          elevation: 10,
                                          color: tPrimary(),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(mediaQueryWidth*0.083))),
                                          child: Text(
                                            'Done',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:mediaQueryWidth*0.040 ,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );

Widget tourPlanCard2({
  required String name,
  required String image,
  double? rating,
  String? distance,
  String? location,
  String? description,
  double? latitude,
  double? longitude,

}) =>
    Builder(
        builder: (context) {
          var mediaQueryHeight= MediaQuery.of(context).size.height;
          var mediaQueryWidth = MediaQuery.of(context).size.width;
          return GestureDetector(
            onTap:(){
              showDialog(context: context,
                builder: (_)=> Dialog(
                    child: SingleChildScrollView(
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: mediaQueryWidth,
                              height: mediaQueryHeight*0.227,
                              child:ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)
                                  ),
                                  child: Image(image: NetworkImage('$image'),
                                    fit: BoxFit.fill,)),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375, vertical: mediaQueryHeight*0.01311),
                              child: CircleAvatar(
                                radius: 22.5,
                                backgroundColor: tPrimary(),
                                child: IconButton(onPressed: () {
                                  Navigator.pop(context);
                                }, icon: const Icon(Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$name',
                                style: const TextStyle(fontSize: 33),),
                              SizedBox(height: mediaQueryHeight*0.019,),
                              aboutDetails(details: '$description'),
                              SizedBox(
                                height: mediaQueryHeight*0.019,
                              ),
                              GestureDetector(
                                onTap: () {
                                  location;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Container(
                                    width: mediaQueryWidth*1.25,
                                    height: mediaQueryHeight*0.163,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: const DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage('assets/images/Map.jpeg'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: mediaQueryHeight*0.019,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(

                                        width: mediaQueryWidth*0.550,
                                        height: mediaQueryHeight*0.081,

                                        child: ElevatedButton(
                                          onPressed: () {
                                            /*addToFavorites(
                                                name: '$name',
                                                image: '$image',
                                                location: '$location',
                                                distance: '$distance',
                                                description: '$description',
                                                latitude: '$latitude',
                                                longitude: '$longitude'
                                            )*/;

                                          },
                                          child: Text.rich(TextSpan(
                                            text: 'Add to Favorites',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: mediaQueryWidth*0.0525),
                                          )),
                                          style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              primary: const Color(0xff292D32)
                                          ),
                                        )
                                    ),
                                  ]),
                              SizedBox(height: mediaQueryHeight*0.019,),
                            ],
                          ),
                        )

                      ],),
                    )
                ),
              );
            } ,
            child: Stack(
              children: [
                Container(

                  width: mediaQueryWidth*0.916,
                  height: mediaQueryHeight*0.159,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mediaQueryWidth*0.083),
                    color: tSecondary(),
                    boxShadow: [
                      BoxShadow(
                        color: tGrey(),
                        offset: const Offset(5, 5),
                        blurRadius: 3,

                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: mediaQueryHeight*0.037,left: mediaQueryWidth*0.027),
                      child: Container(
                        width: mediaQueryWidth*0.277,
                        height: mediaQueryHeight*0.132,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(mediaQueryWidth*0.083),
                          color: tGrey(),
                          image: DecorationImage(
                            image: NetworkImage('$image'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: mediaQueryHeight*0.186,
                          width: mediaQueryWidth*0.555,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: mediaQueryHeight*0.01311),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: mediaQueryWidth*0.486,
                                  height: mediaQueryHeight*0.066,
                                  child: Text(
                                    '$name',
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 16, color: tPrimary(),),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );

Widget categoryCard ({
  required String name,
  required String image,
  required String places
})=> Builder(
    builder: (context) {
      var mediaQueryHeight= MediaQuery.of(context).size.height;
      var mediaQueryWidth = MediaQuery.of(context).size.width;
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const CategoryScreen();
          }));
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                height: mediaQueryHeight*0.200,
                width: mediaQueryWidth*0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: mediaQueryWidth*0.0781,
                  left: mediaQueryWidth*0.0468,
                  top: mediaQueryHeight*0.1475,
                  bottom: 0.01311,
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
                            padding: EdgeInsets.only(
                              top: mediaQueryHeight*0.01311,
                              left: mediaQueryWidth*0.0625,
                              bottom: mediaQueryHeight*0.01311,

                            ),
                            child: SizedBox(
                              width: mediaQueryWidth*0.6875,
                              child: Text(name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: mediaQueryWidth*0.05,
                                    fontWeight: FontWeight.bold

                                ),
                              ),
                            ),
                          ),
                        ],),
                      SizedBox(
                        width:mediaQueryWidth*0.75 ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            SizedBox(width: mediaQueryWidth*0.0400,),
                            Row(
                              children: [
                                const Icon(Icons.location_on_rounded, color: Colors.yellow,),
                                Text(' $places'),

                              ],
                            ),
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

Widget defualtCard1 ({
  required String number,
  required String name,
  required String image,
  required double rating,
  required String distance,
  required String location,
  required String description,
  required double latitude,
  required double longitude,
  IconData icon1 = Icons.star,
  IconData icon3 = Icons.location_on_rounded,
})=> Builder(
    builder: (context) {
      var mediaQueryHeight= MediaQuery.of(context).size.height;
      var mediaQueryWidth = MediaQuery.of(context).size.width;
      Widget buildImage()=> Container(
        height: mediaQueryHeight*0.200,
        width: mediaQueryWidth*0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      );
      return GestureDetector(
        onTap: (){
          showDialog(context: context,
            builder: (_)=> Dialog(
                child: SingleChildScrollView(
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: mediaQueryWidth,
                          height: mediaQueryHeight*0.227,
                          child:ClipRRect(
                              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)
                              ),
                              child: Image(image: NetworkImage(image),
                                fit: BoxFit.fill,)),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375, vertical: mediaQueryHeight*0.01311),
                          child: CircleAvatar(
                            radius: 22.5,
                            backgroundColor: tPrimary(),
                            child: IconButton(onPressed: () {
                              Navigator.pop(context);
                            }, icon: const Icon(Icons.arrow_back,
                              color: Colors.white,
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                            style: const TextStyle(fontSize: 33),),
                          SizedBox(height: mediaQueryHeight*0.019,),
                          aboutDetails(details: description),
                          SizedBox(
                            height: mediaQueryHeight*0.019,
                          ),
                          GestureDetector(
                            onTap: () {
                              Utils.openLink(url:'https://www.google.com/maps/place/The+Great+Pyramid+of+Giza/@29.9792345,31.1342019,17z/data=!3m1!4b1!4m6!3m5!1s0x14584587ac8f291b:0x810c2f3fa2a52424!8m2!3d29.9792345!4d31.1342019!16zL20vMDM2bWs?authuser=0&hl=en');

                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Container(
                                width: mediaQueryWidth*1.25,
                                height: mediaQueryHeight*0.163,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage('assets/images/Map.jpeg'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mediaQueryHeight*0.019,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: mediaQueryWidth*0.156,
                                    height: mediaQueryHeight*0.081,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        addToFavorites(
                                          number: number,
                                            name: name,
                                            image: image,
                                            location: location,
                                            distance: '$distance',
                                            description: description,
                                            latitude: '$latitude',
                                            longitude: '$longitude');
                                      },
                                      child: Icon(Icons.favorite ,
                                        size: mediaQueryWidth*0.0625,
                                        color: Colors.white,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xff292D32),
                                        shape: const CircleBorder(),
                                      ),
                                    )),
                                SizedBox(

                                    width: mediaQueryWidth*0.500,
                                    height: mediaQueryHeight*0.081,

                                    child: ElevatedButton(
                                      onPressed: () {
                                        addToTour(
                                            name: name,
                                            number: number,
                                            image: image,
                                            location: location,
                                            distance: location,
                                            description: description,
                                            latitude: '$latitude',
                                            longitude: '$longitude');

                                      },
                                      child: Text.rich(TextSpan(
                                        text: 'Add to Tour',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: mediaQueryWidth*0.0625),
                                      )),
                                      style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          primary: const Color(0xff292D32)
                                      ),
                                    )
                                ),
                              ]),
                          SizedBox(height: mediaQueryHeight*0.019,),
                        ],
                      ),
                    )

                  ],),
                )
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Hero(
                  tag: attractions,
                  child: buildImage()
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: mediaQueryWidth*0.0650,
                  left: mediaQueryWidth*0.0468,
                  top: mediaQueryHeight*0.1475,
                  bottom: 0.01311,
                ),
                child: Container(
                  height: mediaQueryHeight*0.150,
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
                            padding: EdgeInsets.only(
                              top: mediaQueryHeight*0.01311,
                              left: mediaQueryWidth*0.0625,
                              bottom: mediaQueryHeight*0.01311,

                            ),
                            child: SizedBox(
                              width: mediaQueryWidth*0.6875,
                              child: Text(name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: mediaQueryWidth*0.05,
                                    fontWeight: FontWeight.bold

                                ),
                              ),
                            ),
                          ),
                        ],),
                      SizedBox(
                        width:mediaQueryWidth*0.75 ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            SizedBox(width: mediaQueryWidth*0.0400,),
                            Row(
                              children: [
                                Icon(icon1, color: Colors.yellow,),
                                Text('$rating'),

                              ],
                            ),
                            SizedBox(width: mediaQueryWidth*0.0375,),
                            Row(
                              children: [
                                Icon(icon3, color: Colors.lightBlue,),
                                Text('$distance'),

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
        padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.025, vertical: mediaQueryHeight*0.01311),
        child: CircleAvatar(
          radius: 22.5,
          backgroundColor: tPrimary(),
          child: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          ),
        ),
      );

    }
);

