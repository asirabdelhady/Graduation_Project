import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class TourScreen extends StatefulWidget{
  const TourScreen({Key? key}) : super(key: key);


  @override
  State<TourScreen> createState() => _TourScreenState();
}
//hobv
class _TourScreenState extends State<TourScreen> {
  int index =1;
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text('Tour Plan',
                    style: TextStyle(
                        fontWeight:
                        FontWeight.bold,
                        fontSize: 30),
                )
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
                      categoryCard(minWidth: 101, height: 37, sightname: 'Pyramids', onPressed: (){}, imagePath: '',)

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
                      categoryCard(minWidth: 101, height: 37, sightname: 'The Nile', onPressed: (){}, imagePath: '',)


                    ]),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1 ?
                  StepState.complete : StepState.disabled,
                ),
                Step(
                  title: new Text('Qasr El Baroon'),
                  content: Column(
                    children: [
                      categoryCard(minWidth: 101, height: 37, sightname: 'Qasr El Baroon', onPressed: (){}, imagePath: '',)

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
      ),

    );
  }
}