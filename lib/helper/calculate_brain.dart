import 'dart:math';
import 'package:bmi/main.dart';

var bmi;
var test;

class CalculationBrain {
  CalculationBrain({required this.height, required this.weight});

  int height;
  int weight;

  String calculateBMI() {
    bmi = Weight / pow(height / 100, 2);
    test = bmi;
    return bmi.toStringAsFixed(
        1); //it use to how many fraction part we want. because double can give big fractional value.
  }

  String getResult() {
    if (test == null) {
      return 'give Valid Parameter';

    } else if (test >= 25) {
      // ! for null check.
      return 'OverWeight';
    } else if (test > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getinterpretation() {
    if (test == null) {
      return 'give Valid Parameter';
    } else if (test >= 25) {
      // ! for null check.
      return 'You have a higher than normal body weight.Try to Exercise  more.';
    } else if (test > 18.5) {
      return 'You have a normal body weight. Good Job';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}





//if we make variable in curly bracket then it not be consider outside of curly bracket,then we use _ before variable, then we can use .