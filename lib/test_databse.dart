import 'package:flutter/material.dart';
import 'package:tour_guide_app/tAttraction_model.dart';
import 'package:tour_guide_app/tour_database.dart';

class TestingYoutubeVideo extends StatefulWidget{

  @override
  State<TestingYoutubeVideo> createState() => _TestingYoutubeVideoState();
}

class _TestingYoutubeVideoState extends State<TestingYoutubeVideo> {

  TourDatabase tourDatabase = TourDatabase.instance;

  late List<TAttractions> tAttractions;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    refreshTAttractions();
  }

  Future refreshTAttractions() async{
    setState(()=> isLoading=true);

    this.tAttractions = await TourDatabase.instance.readAllTAttractions();

    setState(()=> isLoading=false);
  }

 Future addTAttraction()async{
    final tAttraction = TAttractions(
        name: 'Pyramids of Giza',
        latitude: '29.9792',
        longitude: '31.1342',
        imagePath: 'assets/images/Pyramids.jpg',
        rating: '4.9',
        description: '''
        Pyramids of Giza have always been one of the best
         highlights of the city. The heat and the dust appear to be trivial 
         to explorers when they experience the superb Pyramid of Cheops,
          which is the biggest pyramid in the Giza collection. Otherwise 
          called the Great Pyramid or the Pyramid of Khufu, it has a plain 
          wonderful tomb chamber with a sarcophagus. The intriguing slender 
          sections inside the Pyramids take you into the Solar Boat gallery 
          showing fabulous sun-controlled barques revealed in the area that 
          has been carefully re-established to its unique excellence. 
          Towards the south you would discover the Pyramid of Chephren 
          normally called as the Pyramid of Khefre, within which is an 
          enormous passage. Guarding these funeral home sanctuaries is
           the baffling Sphinx which is line-bodied and faced like a 
           pharaoh and presumably the most praised landmark in Cairo. 
           This fascination is really an antiquated world's prominent milestones.
        ''',
        distance: "20km",
        location: 'https://www.google.com/maps/place/The+Great+Pyramid+of+Giza/@29.9792345,31.1342019,15z/data=!4m5!3m4!1s0x0:0x810c2f3fa2a52424!8m2!3d29.9792345!4d31.1342019'
    );
    await TourDatabase.instance.create(tAttraction);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          ElevatedButton(onPressed: (){
            addTAttraction();
          }, child: Text('add')),
          ElevatedButton(onPressed: (){
            TourDatabase.instance.readAllTAttractions();
          }, child: Text('print')),
          /*FutureBuilder(
              future: tourDatabase.readAllTAttractions(),
              builder: (context, snapshot) {
            if(snapshot.hasError) print('error');
            var data=snapshot.data;
            return snapshot.hasData ? TAttractions() : new Center(child: Text('You have no contacts'),);
          }))*/
        ],),
      ),


    );
  }
}