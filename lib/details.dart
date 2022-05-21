import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

class Details extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;


    int index=0;
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

                        child: Image(image: AssetImage('assets/images/Pyramids3.jpg'),
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
            ExpansionTile(
                title: subTitle(subTitle: 'The Great Pyramids of Giza'),
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //defaultTitle(title: '${model['name']}'),
                      SizedBox(height: mediaQueryHeight*0.019,),
                      aboutDetails(details: 'description'),
                      SizedBox(
                        height: mediaQueryHeight*0.019,
                      ),
                      GestureDetector(
                        onTap: () {

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

                                  },
                                  child: Icon(Icons.favorite ,
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
                )

              ],
            ),


          ]),
        ),
      ),
    );
  }
}