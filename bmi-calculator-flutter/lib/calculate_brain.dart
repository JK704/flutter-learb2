import 'dart:math';

class CalculateBMI {
  CalculateBMI(this.height, this.weight);

  int height;
  int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else
      return 'UnderWeight';
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Abey mote, please try to move your fucking body sometimes!!';
    } else if (_bmi > 18.5) {
      return 'shi hai londe!! ab jyada mat pel dena bc!!';
    } else
      return 'abey sukhad, kuch kha liya kar bc!!';
  }
}
