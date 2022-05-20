import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';
import 'package:tour_guide_app/tour_database.dart';

import '../../shared/components/constants.dart';
import '../../tAttraction_model.dart';

class DetailScreen extends StatefulWidget {

  DetailScreen(List<Map> model);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  bool favClicked = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

  }
  Future refreshTAttractions() async{
    setState(()=> isLoading=true);

   // this.tAttractions = (await TourDatabase.instance.readTAttraction(widget.tAttractionId)) as TAttractions;

    setState(()=> isLoading=false);
  }
  
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;


    int index=0;
    return Scaffold(

      body: Hero(
        tag: tAttractions ,
        child: SafeArea(
          child:SingleChildScrollView(
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Stack(
                    children: [
                      Container(
                        width: mediaQueryWidth,
                        height: mediaQueryHeight*0.327,
                        child: PageView.builder(
                          itemBuilder: (context, position)=>ClipRRect(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)
                            ),

                            child: Image(image: AssetImage('${tAttractions[index]['image']}'),
                              fit: BoxFit.fill,)),
                          itemCount: 4,
                          controller: pageController,

                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375, vertical: mediaQueryHeight*0.01311),
                        child: CircleAvatar(
                          radius: 22.5,
                          backgroundColor: tPrimary(),
                          child: IconButton(onPressed: () {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mediaQueryHeight*0.019,),
                  Center(
                    child: SmoothPageIndicator(controller: pageController,
                        count: 4,
                        effect: WormEffect(
                          activeDotColor: tPrimary(),
                        ),

                    ),
                  ),
                   SizedBox(
                    height: mediaQueryHeight*0.019,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultTitle(title: ''),
                         SizedBox(height: mediaQueryHeight*0.019,),
                        aboutDetails(details: ''),
                         SizedBox(
                          height: mediaQueryHeight*0.019,
                        ),
                        GestureDetector(
                          onTap: () {
                            //model['location'];
                          },
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
                        ),
                         SizedBox(
                          height: mediaQueryHeight*0.019,
                        ),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: mediaQueryWidth*0.156,
                              height: mediaQueryHeight*0.081,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                  favClicked=!favClicked;
                                  });
                                },
                                child: Icon((favClicked==false)? Icons.favorite_border_rounded : Icons.favorite ,
                                  size: mediaQueryWidth*0.0625,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff292D32),
                                  shape: CircleBorder(),
                                ),
                              )),
                          Container(

                              width: mediaQueryWidth*0.625,
                              height: mediaQueryHeight*0.081,

                            //  width: mediaQueryWidth*0.625,//mediaQueryWidth*0.70,
                            //  height: mediaQueryHeight*0.081,//mediaQueryHeight*0.081,

                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text.rich(TextSpan(
                                  text: 'Add to Tour',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: mediaQueryWidth*0.0625),
                                )),
                                style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Color(0xff292D32)
                                ),
                              )
                          ),
                        ]),
                         SizedBox(height: mediaQueryHeight*0.019,),
                      ],
                    ),
                  ),
                ]),
              ),
        ),
      ),
    );
  }
}
