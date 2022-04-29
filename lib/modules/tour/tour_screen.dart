import 'package:flutter/material.dart';
import 'package:tour_guide_app/shared/styles/colors.dart';

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
            child: Theme(
              data:ThemeData(
                primaryColor: tPrimary(),

              ) ,
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                //currentStep: _currentStep,
                //onStepTapped: (step) => tapped(step),
                //onStepContinue:  continued,
                //onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: Text('The Great Pyramids of Giza'),
                    content: Column(
                      children: [
                        stepperCard(placeName: 'The Great Pyramids of Giza', imagePath: 'assets/images/Pyramids.jpg')

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
                        stepperCard(placeName: 'The Great Pyramids of Giza', imagePath: 'assets/images/Pyramids.jpg')

                      ]),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Qasr El Baroon'),
                    content: Column(
                      children: [
                        stepperCard(placeName: 'The Great Pyramids of Giza', imagePath: 'assets/images/Pyramids.jpg')

                      ],
                    ),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 2 ?
                    StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            ),
          ),
            ]),
      ),

    );
  }
}