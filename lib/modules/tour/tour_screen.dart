import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tour_guide_app/modules/details/details_screen.dart';

import '../../shared/components/components.dart';

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
  int index =1;

  final List<Place> _items = [
    Place(

      name: "The Great Pyramids Of Giza", image: 'assets/images/egypt-cairo-pyramids-of-giza-and camels-2.jpg',
    ),
    Place(

      name: "The asdGreat Pyramids Of Giza", image: 'assets/images/Pyramids.jpg',
    ),
    Place(

      name: "name 2", image: 'assets/images/Pyramids1.jpg',
    ),
    Place(

      name: "name 3", image: 'assets/images/Pyramids2.jpg',
    ),
    Place(

      name: "name 4", image: 'assets/images/Pyramids3.jpg',
    ),
    Place(

      name: "name 5", image: 'assets/images/Pyramids1.jpg',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: Colors.transparent,
        title: Text('Tour Plan',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: mediaQueryWidth*0.093),
        ) ,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: ReorderableListView(
          onReorder: onReorder,
          children: _getListItems(),
        ),
      ),

    );
  }


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
  List<Widget> _getListItems() => _items
      .asMap()
      .map((i, item) => MapEntry(i, _buildTenableListTile(item, i)))
      .values
      .toList();

  Widget _buildTenableListTile(Place item, int index) {
    return Dismissible(
      key: Key(item.name),
      onDismissed: (direction) {
        setState(() {
          _items.removeAt(index);
        });
      },
      background: Container(color: Colors.transparent,child: const Center(child: Text('Swipe left or right to delete')),),
      child: ListTile(
        key: ValueKey(item.name),
       subtitle: tourPlanCard(
           sightName: item.name,
           onButtonPressed: (){
             setState(() {
               _items.removeAt(index);
               Fluttertoast.showToast(
                   msg: 'This is toast notification',
                   toastLength: Toast.LENGTH_SHORT,

               );
             });

           },
           onCardTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return const DetailScreen();
             }));
           },
           imagePath: item.image),
        onTap: () {},
        minLeadingWidth: double.infinity,
      ),
    );
  }

}
