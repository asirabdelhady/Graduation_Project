import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class Place {
  String name;
  String image;
  Place({required this.name,required this.image});
}

class TourScreen extends StatefulWidget{
  const TourScreen({Key? key}) : super(key: key);
  @override
  State<TourScreen> createState() => _TourScreenState();

}
class _TourScreenState extends State<TourScreen> {
  int index = 1;
  final Stream<QuerySnapshot> tour = FirebaseFirestore.instance.collection('tour').snapshots();

  @override
  void initState() {
    //getAllTour();
    super.initState();
  }
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: mediaQueryHeight,
          width: mediaQueryWidth,
          child: Image.asset('assets/images/application background.png',
            fit: BoxFit.cover,),

        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      defaultTitle(title: 'Tour Plan', fontWeight: FontWeight.bold),
                    ]),
                Expanded(
                  child: StreamBuilder(
                    stream: tour ,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot){
                      if (snapshot.hasError){
                        return Text('somthing went wrong');
                      }
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator());
                      }
                      final data = snapshot.requireData;
                      return Container(
                        width: mediaQueryWidth,
                        height: mediaQueryHeight,
                        child: ListView.builder(
                            itemCount: data.size,
                            itemBuilder:(context, index) {
                              return tourPlanCard1(
                                  name: data.docs[index]["name"],
                                  image: data.docs[index]["image"],
                                  description: data.docs[index]["description"],
                                  );
                            }),
                      );
                    },
                  ),
                ),
              ],
            ),

          ),
        ),
      ],
    );
  }
}

/*
  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    setState(() {
      Place song = _items[oldIndex];

      _items.removeAt(oldIndex);
      _items.insert(newIndex, song);
    });
  }
  List<Widget> _getListItems() => tour
      .asMap()
      .map((i, item) => MapEntry(i, _buildTenableListTile(item, i)))
      .values
      .toList();

  Widget _buildTenableListTile(tour, int index) {
    return Dismissible(
      key: Key(tour[index]),
      onDismissed: (direction) {
        setState(() {
          tour.removeAt(index);
        });
      },
      background: Container(color: Colors.transparent,child: const Center(child: Text('Swipe left or right to delete')),),
      child: ListTile(
        key: ValueKey(tour[index]),
       subtitle: ListView.builder(
           itemBuilder: (context, index) => tourPlanCard(tour[index])),
        onTap: () {},
        minLeadingWidth: double.infinity,
      ),
    );
  }

}
*/
