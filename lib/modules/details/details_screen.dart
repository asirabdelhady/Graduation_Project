import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

import '../../shared/components/constants.dart';
import '../../tAttraction_model.dart';

class DetailScreen extends StatefulWidget {


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

   // this.attractions = (await TourDatabase.instance.readTAttraction(widget.tAttractionId)) as TAttractions;

    setState(()=> isLoading=false);
  }
  
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;


    int index=0;
    return Scaffold();


  }
}
