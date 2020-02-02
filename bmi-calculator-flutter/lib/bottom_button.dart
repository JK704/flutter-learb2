import 'package:bmi_calculator/size_config.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.buttonText});
  final Function onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.blockSizeVertical * 3,
                fontWeight: FontWeight.bold),
          ),
        ),
        color: kBottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
        padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
        height: SizeConfig.blockSizeVertical * 10,
      ),
    );
  }
}
