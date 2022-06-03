import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

class CategoryScreen extends StatefulWidget{
  const CategoryScreen({Key? key}) : super(key: key);


  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
   Firebase.initializeApp().whenComplete(() {
     print("completed");
     setState(() {});
   });
   super.initState();
  }
  final Stream<QuerySnapshot> attractions = FirebaseFirestore.instance.collection('tAttraction').snapshots();
  final Stream<QuerySnapshot> entertainment = FirebaseFirestore.instance.collection('entertainment').snapshots();
  final Stream<QuerySnapshot> hotels = FirebaseFirestore.instance.collection('hotels').snapshots();

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    PageController recommendedPageController =PageController(initialPage: 0);
    PageController attractionsPageController =PageController(initialPage: 0);
    PageController hotelsPageController =PageController(initialPage: 0);
    PageController entertainmentPageController =PageController(initialPage: 0);
    PageController scrollController = PageController();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.start ,
                  children: [
                    backButton(),
                    defaultTitle(title: 'Categories'),
                  ],
                ),
                Container(
                  height: mediaQueryHeight*0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mediaQueryWidth*0.0625),
                    border: Border.all(
                      color: tGrey(),
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                ),
                SizedBox(height: mediaQueryHeight*0.039,),
                Column(
                  children: [
                    SizedBox(height: mediaQueryHeight*0.049,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subTitle(subTitle: 'Tourist Attractions'),
                        const Icon(Icons.keyboard_arrow_right),
                      ],),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                          height: mediaQueryHeight*0.322,
                          width: mediaQueryWidth,
                          child: StreamBuilder(
                            stream: attractions ,
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
                                    controller: attractionsPageController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.size,
                                    itemBuilder:(context, index) {
                                      return defualtCard1(
                                          number: data.docs[index]["number"],
                                          name: data.docs[index]["name"],
                                          image: data.docs[index]["image"],
                                          rating: data.docs[index]["rating"],
                                          distance: data.docs[index]["distance"],
                                          location: data.docs[index]["location"],
                                          description: data.docs[index]["description"],
                                          latitude: data.docs[index]["latitude"],
                                          longitude: data.docs[index]["longitude"]) ;
                                    }),
                              );
                            },
                          )
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: attractionsPageController,
                        count: 30,
                        effect: ScrollingDotsEffect(
                          dotColor: tGrey(),
                          activeDotColor: tPrimary(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subTitle(subTitle: 'Hotels'),
                        const Icon(Icons.keyboard_arrow_right),
                      ],),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                          height: mediaQueryHeight*0.322,
                          width: mediaQueryWidth,
                          child: StreamBuilder(
                            stream: hotels ,
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
                                    controller: hotelsPageController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.size,
                                    itemBuilder:(context, index) {
                                      return defualtCard1(
                                          number: data.docs[index]["number"],
                                          name: data.docs[index]["name"],
                                          image: data.docs[index]["image"],
                                          rating: data.docs[index]["rating"],
                                          distance: data.docs[index]["distance"],
                                          location: data.docs[index]["location"],
                                          description: data.docs[index]["description"],
                                          latitude: data.docs[index]["latitude"],
                                          longitude: data.docs[index]["longitude"]) ;
                                    }),
                              );
                            },
                          )
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: hotelsPageController,
                        count: 21,
                        effect: ScrollingDotsEffect(
                          dotColor: tGrey(),
                          activeDotColor: tPrimary(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subTitle(subTitle: 'Entertainment'),
                        const Icon(Icons.keyboard_arrow_right),
                      ],),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                          height: mediaQueryHeight*0.322,
                          width: mediaQueryWidth,
                          child: StreamBuilder(
                            stream: entertainment ,
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
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.size,
                                    controller: entertainmentPageController,
                                    itemBuilder:(context, index) {
                                      return defualtCard1(
                                          number: data.docs[index]["number"],
                                          name: data.docs[index]["name"],
                                          image: data.docs[index]["image"],
                                          rating: data.docs[index]["rating"],
                                          distance: data.docs[index]["distance"],
                                          location: data.docs[index]["location"],
                                          description: data.docs[index]["description"],
                                          latitude: data.docs[index]["latitude"],
                                          longitude: data.docs[index]["longitude"]) ;
                                    }),
                              );
                            },
                          )
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: entertainmentPageController,
                        count: 20,
                        effect: ScrollingDotsEffect(
                          dotColor: tGrey(),
                          activeDotColor: tPrimary(),
                        ),
                      ),
                    ),
                    SizedBox(height: mediaQueryHeight*0.049,),
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

