import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/components/components.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0,vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                children:
                [
                  Row(
                    children:
                    [
                      Expanded(
                        child:
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(20),

                          ),


                          height: 47,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: const [
                                  Icon(Icons.search,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  SizedBox(width: 5,),
                                  Text('Search',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ),

                    ],
                  ),
                  const SizedBox(height: 24,
                  ),
                  Row(
                    children:
                    [
                      Expanded(
                        child:
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(20),

                          ),


                          height: 150,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: const [
                                  Icon(Icons.search,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  SizedBox(width: 5,),
                                  Text('Search',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height: 24,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                      [
                        categoryButton(
                          text: 'all', iconshape: Icons.plus_one_sharp
                        ),
                        const SizedBox(width: 10,),
                        categoryButton(text: 'music',iconshape: Icons.music_note_outlined),


                      ],
                    ),
                  ),
                  const SizedBox(height: 24,
                  ),
                  Row(
                    children:
                    const [
                      Text('Recommended',
                        style: TextStyle(
                          fontSize: 16,

                        ),),
                    ],
                  ),
                  const SizedBox(height: 24,
                  ),
                  Row(
                    children:
                    [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            image:const DecorationImage(

                              image: NetworkImage('https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/39/9d/32.jpg',),
                              fit: BoxFit.fill,
                            ),

                          ),
                          height: 150,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            image:const DecorationImage(

                              image: NetworkImage('https://mlrhpz8jmuut.i.optimole.com/BDSiYJw-s4o_NhSn/w:710/h:707/q:85/https://egypttoursplus.com/wp-content/uploads/2014/03/Cairo-Tower-seen-from-the-Nile-River.jpg',
                              ),
                              fit: BoxFit.fill,
                            ),

                          ),
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );

  }

}
