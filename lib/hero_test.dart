import 'package:flutter/material.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';
import 'package:tour_guide_app/second_detail.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/components/constants.dart';

class HeroTesting extends StatefulWidget{
  @override
  State<HeroTesting> createState() => _HeroTestingState();
}

class _HeroTestingState extends State<HeroTesting> {

  @override
  void initState() {
    super.initState();
    createDatabase().then((value) {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {

    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    PageController entertainmentPageController =PageController(initialPage: 0);

    final items = attractions;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
                height: mediaQueryHeight*0.322,
                width: mediaQueryWidth,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> detailsPage(attractions[index])));
                    },
                      child: defualtCard(attractions[index])),
                  itemCount: attractions.length,
                  controller: entertainmentPageController,
                )
            ),
          ),
        ],),
      ),
    );
  }
}