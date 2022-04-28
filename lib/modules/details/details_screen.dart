

import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      body: SafeArea(
        child:SingleChildScrollView(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Stack(
                  children: [

                     ClipRRect(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)
                          ),

                        child: Image(image: AssetImage('assets/images/Pyramids.jpg'),
                        fit: BoxFit.fill,)),
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
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      detailsTitle(title: 'The Great Pyramids Of Giza'),
                      const SizedBox(height: 12,),
                      aboutDetails(details: 'Pyramids of Giza, Arabic Ahrāmāt Al-Jīzah, Giza also spelled Gizeh, three 4th-dynasty (c. 2575–c. 2465 BCE) pyramids erected on a rocky ...more'),
                      const SizedBox(
                        height: 12,
                      ),
                      subTitle(subTitle: 'Images'),
                      const SizedBox(
                        height: 12,
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                                width: 70, //MediaQuery.of(context).size.width,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/Pyramids1.jpg')))),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                                width: 70, //MediaQuery.of(context).size.width,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/Pyramids1.jpg')))),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                                width: 70, //MediaQuery.of(context).size.width,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/Pyramids1.jpg')))),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                                width: 70, //MediaQuery.of(context).size.width,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/Pyramids1.jpg')))),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                                width: 70, //MediaQuery.of(context).size.width,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/Pyramids1.jpg')))),
                          ]),
                        ),
                      const SizedBox(
                        height: 12,
                      ),
                      mapButton(),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 50,
                            height: 50,
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
                      ]),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
      ),
    );
  }
}
