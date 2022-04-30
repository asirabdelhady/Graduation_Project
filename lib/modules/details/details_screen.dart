

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool favClicked = false;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.height;
    Widget _buildPageItem(int index) {
      return defualtCard(placeName: 'Pyramids', imagePath: 'assets/images/Pyramids.jpg');
    }

    return Scaffold(

      body: SafeArea(
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

                          child: Image(image: AssetImage('assets/images/Pyramids.jpg'),
                            fit: BoxFit.fill,)),
                        itemCount: 4,
                        controller: pageController,

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      detailsTitle(title: 'The Great Pyramids Of Giza'),
                       SizedBox(height: mediaQueryHeight*0.019,),
                      aboutDetails(details: 'Pyramids of Giza, Arabic Ahrāmāt Al-Jīzah, Giza also spelled Gizeh, three 4th-dynasty (c. 2575–c. 2465 BCE) pyramids erected on a rocky asdasdasdasdf fsdfds afsad kj hdfjdshfdsnhfsdhfgdsfnhdsfjdsfdsgmnfdasfjdsfdasbjfdsfdsfdfdsfdsfydsfdstbf adskyfadsh fdsmfmsadgjf'),
                       SizedBox(
                        height: mediaQueryHeight*0.019,
                      ),
                      mapButton(),
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
                                size: 20,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff292D32),
                                shape: CircleBorder(),
                              ),
                            )),
                        Container(
                            width: mediaQueryWidth*0.29,
                            height: mediaQueryHeight*0.081,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text.rich(TextSpan(
                                text: 'Add to Tour',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
    );
  }
}
