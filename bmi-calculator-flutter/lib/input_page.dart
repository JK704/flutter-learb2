import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusabe_card.dart';
import 'reusable_icon.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculate_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 74;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableColumnIcon(
                      newIcon: FontAwesomeIcons.mars,
                      textString: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableColumnIcon(
                      newIcon: FontAwesomeIcons.venus,
                      textString: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 3,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: SizeConfig.blockSizeVertical * 6,
                              ),
                            ),
                            Text(
                              "cm",
                              style: TextStyle(
                                fontSize: SizeConfig.blockSizeVertical * 3,
                                color: Color(0xFF8D8E98),
                              ),
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.pink.shade900,
                              inactiveTrackColor: Colors.pink.shade200,
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 15.0),
                              thumbColor: kBottomContainerColor),
                          child: Slider(
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 3,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: SizeConfig.blockSizeVertical * 6,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButtonIcon(
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                buttonIcon: FontAwesomeIcons.minus),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 2,
                            ),
                            RoundButtonIcon(
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                buttonIcon: FontAwesomeIcons.plus),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 3,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: SizeConfig.blockSizeVertical * 6,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButtonIcon(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              buttonIcon: FontAwesomeIcons.minus),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 3,
                          ),
                          RoundButtonIcon(
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              buttonIcon: FontAwesomeIcons.plus),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE YOUR BMI',
            onTap: () {
              CalculateBMI calc = CalculateBMI(height, weight);
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: calc.calculateBMI(),
                      bmiResult: calc.getResult(),
                      bmiInterpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}

class RoundButtonIcon extends StatelessWidget {
  RoundButtonIcon({this.buttonIcon, this.onPress});
  final IconData buttonIcon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(buttonIcon),
      constraints: BoxConstraints.tightFor(
          width: SizeConfig.blockSizeHorizontal * 10,
          height: SizeConfig.blockSizeVertical * 10),
      elevation: SizeConfig.blockSizeVertical * 1,
    );
  }
}
