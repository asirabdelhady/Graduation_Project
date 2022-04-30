import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/components/components.dart';
class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int index =4;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
          body: Padding(
              padding:  EdgeInsets.symmetric(horizontal:mediaQueryWidth*0.0375 ),
              child: Column(children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    defaultTitle(title: 'Profile', fontWeight: FontWeight.bold),
                    Container(
                      width: mediaQueryWidth*0.156,
                      height: mediaQueryHeight*0.0655,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(),
                      ),
                        child: IconButton(icon: const Icon(Icons.edit_outlined), onPressed: (){})),
                ]),
                 SizedBox(height: mediaQueryHeight*0.0196),
                profileHeader(imagePath: 'assets/images/Pyramids.jpg', name: 'Asir Abdelhady', age: 22, nationality: 'Egypt'),
                profileBody(),

              ]),
            ),

        ),
    );
  }
}
