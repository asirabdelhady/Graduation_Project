import 'package:flutter/material.dart';

class TourScreen extends StatefulWidget{
  const TourScreen({Key? key}) : super(key: key);


  @override
  State<TourScreen> createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  int index =1;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text.rich(TextSpan(text: 'Tour Plan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
            ),
            /* Expanded(
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
        ),*/
          ]),

    );
  }
}