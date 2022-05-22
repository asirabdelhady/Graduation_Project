import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';

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

  @override
  void initState() {
    getAllTour(context).then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text('Tour Plan',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: mediaQueryWidth * 0.093),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => tourPlanCard(tour[index]),
        itemCount: tour.length,
      ),

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
