import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/components/components.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

class ProfileEditScreen extends StatelessWidget{
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight=MediaQuery.of(context).size.height;
    var mediaQueryWidth=MediaQuery.of(context).size.width;

    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController nationalController = TextEditingController();

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  backButton(),
                  defaultTitle(title: 'Profile', fontWeight: FontWeight.bold),
                  Container(
                      width: mediaQueryWidth*0.156,
                      height: mediaQueryHeight*0.0655,
                      decoration: BoxDecoration(
                        color: tPrimary(),
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(),
                      ),
                      child: IconButton(
                          icon: const Icon(Icons.edit_outlined, color: Colors.white,),
                          onPressed: (){})),
                ]),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: mediaQueryWidth*0.468,
                  height: mediaQueryHeight*0.245,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/Pic2.jpg')
                    ),
                  ),
                ),
                SizedBox(height: mediaQueryHeight*0.0491,),
                Container(
                  height: mediaQueryHeight*0.5557388,
                  width: mediaQueryWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    color: tPrimary(),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: mediaQueryHeight*0.0491),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: mediaQueryHeight*0.0196),
                          width: mediaQueryWidth*.75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: tGrey())
                          ),
                          child: TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person, color: tPrimary(),),
                              border: InputBorder.none,
                              hintText: 'Full Name',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: mediaQueryHeight*0.0196),
                          width: mediaQueryWidth*0.75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: tGrey())
                          ),
                          child: TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today_outlined, color: tPrimary(),),
                                border: InputBorder.none,
                                hintText: 'Date of Birth'
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: mediaQueryHeight*0.0196),
                          width: mediaQueryWidth*0.75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: tGrey())
                          ),
                          child: TextFormField(
                            controller: nationalController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.flag_outlined, color: tPrimary(),),
                                border: InputBorder.none,
                                hintText: 'Nationality',
                            ),
                          ),
                        ),
                        ElevatedButton(onPressed: (){},
                            child: Text('Save', style: TextStyle(color: tPrimary()),),
                          style: ElevatedButton.styleFrom(
                            primary: tSecondary(),
                            shape: StadiumBorder(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],),
        ),
      ),
    );
  }
}