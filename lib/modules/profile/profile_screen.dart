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

    return  SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    const Text('Profile',
                        style: TextStyle(
                            fontWeight:
                            FontWeight.bold,
                            fontSize: 30)
                  ),
                    Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(),
                      ),
                        child: IconButton(icon: const Icon(Icons.edit_outlined), onPressed: (){})),
                ]),
                const SizedBox(height: 12),
                profileHeader(imagePath: 'assets/images/Pyramids.jpg', name: 'Asir Abdelhady', age: 22, nationality: 'Egypt'),
                profileBody(),

              ]),
            ),

        ),
    );
  }
}
