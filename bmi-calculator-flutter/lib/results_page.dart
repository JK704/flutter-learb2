import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusabe_card.dart';
import 'package:bmi_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmi,
      @required this.bmiResult,
      @required this.bmiInterpretation});

  final String bmi;
  final String bmiResult;
  final String bmiInterpretation;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                child: Text(
                  'YOUR RESULT',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kInactiveCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      bmiResult,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: SizeConfig.blockSizeVertical * 3,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 8,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Normal BMI range:',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: SizeConfig.blockSizeVertical * 3,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(' 18.5 - 24.9 kg/m2',
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2,
                        )),
                    Text(
                      bmiInterpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeVertical * 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonText: 'RE-CALCULATE BMI',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
