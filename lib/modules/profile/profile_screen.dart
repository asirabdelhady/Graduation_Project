import 'package:flutter/material.dart';
import 'package:tour_guide_app/profileEdit_screen.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/components/constants.dart';
class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int index =4;

  @override
  void initState() {
    getAllHistory();
    getAllFavorites();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;
    return  SafeArea(
      bottom: false,
      child: Scaffold(
          body: Padding(
              padding:  EdgeInsets.symmetric(horizontal:mediaQueryWidth*0.0375 ),
              child: Column(children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    defaultTitle(title: 'Profile', fontWeight: FontWeight.bold),
                   /* Container(
                      width: mediaQueryWidth*0.156,
                      height: mediaQueryHeight*0.0655,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(),
                      ),
                        child: IconButton(
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: (){
                              Navigator. push(context, MaterialPageRoute(builder: (context)=> ProfileEditScreen()));
                            })),*/
                ]),
                 SizedBox(height: mediaQueryHeight*0.0196),
                profileHeader(imagePath: 'assets/images/kisspng-computer-icons-user-profile-info-5acde51ebdcc36.0919547315234429747774.png', name: 'Hobv', age: 23),
                profileBody(),

              ]),
            ),

        ),
    );
  }
}
