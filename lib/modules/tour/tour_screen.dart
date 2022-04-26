import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/components/components.dart';


class TourScreen extends StatelessWidget{

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0.0,
        title: Row(
          children:
          [
            IconButton(
                onPressed: (){},
                icon:CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.cloud_outlined,
                    color: Colors.white,
                    size: 15,
                  ),
                )

            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child:
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(10),

                ),


                height: 26,
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.location_on_outlined,
                      color: Colors.black,
                      size: 17,

                    ),
                  ),
                ),
              ),

            ),
            SizedBox(
              width: 15,
            ),
            IconButton(
                onPressed: (){},
                icon:CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 15,
                  ),
                )

            ),
          ],
        ),
      ),
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text.rich(TextSpan(text: 'Tour Plan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          ),
          Expanded(
          child: Stepper(
            type: stepperType,
            physics: ScrollPhysics(),
            currentStep: _currentStep,
            //onStepTapped: (step) => tapped(step),
            //onStepContinue:  continued,
            //onStepCancel: cancel,
            steps: <Step>[
              Step(
                title: Text('The Great Pyramids of Giza'),
                content: Column(
                  children: [
                    categoryCard(minWidth: 101, height: 37, sightname: 'Pyramids', onPressed: (){},)

                  ]
                ),
                isActive: _currentStep >= 0,
                state: _currentStep >= 0 ?
               StepState.complete : StepState.disabled,
              ),
              Step(
                title: new Text('The Nile River'),
                content: Column(
                  children: [
                    categoryCard(minWidth: 101, height: 37, sightname: 'The Nile', onPressed: (){},)


                  ]),
                isActive: _currentStep >= 0,
                state: _currentStep >= 1 ?
                StepState.complete : StepState.disabled,
              ),
              Step(
                title: new Text('Qasr El Baroon'),
                content: Column(
                  children: [
                    categoryCard(minWidth: 101, height: 37, sightname: 'Qasr El Baroon', onPressed: (){},)

                  ],
                ),
                isActive:_currentStep >= 0,
                state: _currentStep >= 2 ?
                StepState.complete : StepState.disabled,
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.add, size: 30,color: Colors.white,),
          Icon(Icons.list, size: 30,color: Colors.white),
          Icon(Icons.perm_identity, size: 30,color: Colors.white),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.grey,
        backgroundColor: Colors.red.withOpacity(0),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          //setState(() {
            //_page = index;
          //}
          //);
        },
      ),

    );
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }
  continued(){
    _currentStep < 2 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}

setState(int Function() param0) {
}