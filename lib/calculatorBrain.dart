import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final double height;
  final double weight;
  double _bmi;

  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  List<String> resultBMI() {
    if (_bmi >= 25.0) {
      return [
        "OVERWEIGHT",
        "You have a higher than normal body weight. Try to Exercise more."
      ];
    } else if (_bmi > 18.5) {
      return [
        "NORMAL",
        "You have normal body weight and height ratio. Keep up the Good Work."
      ];
    } else {
      return [
        "UNDERWEIGHT",
        "You have a less than normal body weight. Try to gain some weights."
      ];
    }
  }
}
