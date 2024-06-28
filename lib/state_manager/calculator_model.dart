import 'package:flutter/material.dart';
import 'package:flutter_basic_calculator/widgets/input_screen_widget.dart';
import '../utils/evaluate_expression.dart';
import '../models/custom_button.dart';

class CalculatorModel extends ChangeNotifier {
  bool isDarkTheme = false;
  String inputValue = '0';
  String outputValue = '';

  void setTheme(bool value) {
    isDarkTheme = value;
    notifyListeners();
  }

  void setInputValue(String value) {
    if (value == 'ANS') {
      // To Do
    } else if (inputValue == '0' && value != '.') {
      inputValue = value;
      notifyListeners();
    } else if (value == '.') {
      insertComma(value);
    } else {
      insertValue(value);
    }
    // switch (value) {
    //   case '.':
    //     insertComma(value);
    //     break;
    //   default:
    //     insertZero(value);
    // }
  }

  void insertValue(String value) {
    inputValue += value;
    notifyListeners();
  }

  // void insertZero(String value) {
  //   if (inputValue == '0') {
  //     inputValue = value;
  //     notifyListeners();
  //   } else {
  //     insertValue(value);
  //   }
  // }

  void insertComma(String value) {
    if (lastInputIsNumberValue()) {
      insertValue(value);
    }
  }

  void printOperatorToScreen(String value) {
    if (lastInputIsNumberValue()) {
      insertValue(value);
    }
  }

  bool lastInputIsNumberValue() {
    return [for (var i = 0; i < 10; i++) i.toString()]
        .contains(inputValue.split('').last);
  }

  void resetScreen() {
    if (inputValue != '0') {
      inputValue = '0';
      outputValue = '';
      notifyListeners();
    }
  }

  void delCharacter() {
    if (inputValue != '0') {
      List<String> splitValue = inputValue.split('');
      splitValue.removeLast();
      inputValue = splitValue.join('');
      notifyListeners();
    }
  }

  void showResult() {
    if (lastInputIsNumberValue()) {
      final replaceInputValue = inputValue.replaceAll('x', '*');
      outputValue = evaluateStringExpression(replaceInputValue).toString();
      notifyListeners();
    }
  }
}
