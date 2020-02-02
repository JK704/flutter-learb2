import 'package:flutter/material.dart';
import 'size_config.dart';

class ReusableColumnIcon extends StatelessWidget {
  ReusableColumnIcon({this.newIcon, this.textString});
  final IconData newIcon;
  final String textString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(newIcon, size: SizeConfig.blockSizeVertical * 8),
        SizedBox(height: SizeConfig.blockSizeVertical * 3),
        Text(
          textString,
          style: TextStyle(
            fontSize: SizeConfig.blockSizeVertical * 3,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
