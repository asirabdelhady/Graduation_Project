import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/components/constants.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

class SecondDetails extends StatefulWidget{

  @override
  State<SecondDetails> createState() => _SecondDetailsState();

  SecondDetails(List<Map> model);
}

class _SecondDetailsState extends State<SecondDetails> {


  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight= MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    bool favClicked = false;

    return Scaffold(
      body: PageView.builder(itemBuilder: (context, index) {
        return detailsPage(tAttractions[index]);
      })
    );


  }

}

Widget detailsPage(Map model)=> Builder(
    builder: (context) {
      var mediaQueryHeight= MediaQuery.of(context).size.height;
      var mediaQueryWidth = MediaQuery.of(context).size.width;
      bool favClicked = false;
      return     PageView(children: [
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Stack(
                  children: [
                    Container(
                      width: mediaQueryWidth,
                      height: mediaQueryHeight*0.327,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)
                          ),

                          child: Image(image: AssetImage('${model['image']}'),
                            fit: BoxFit.fill,)
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

                SizedBox(
                  height: mediaQueryHeight*0.019,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: mediaQueryWidth*0.0375),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultTitle(title: '${model['name']}'),
                      SizedBox(height: mediaQueryHeight*0.019,),
                      aboutDetails(details: '${model['description']}'),
                      SizedBox(
                        height: mediaQueryHeight*0.019,
                      ),
                      GestureDetector(
                        onTap: () {
                          model['googleMapLocation'].toString();
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
                                    /*setState(() {
                                      favClicked=!favClicked;
                                    });*/
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
      ],);
    }
);