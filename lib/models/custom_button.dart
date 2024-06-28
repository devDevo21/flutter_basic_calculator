import 'package:flutter/material.dart';

class CustomButton {
  late Color bgColor;
  late Color color;
  String value;
  bool isDarkTheme;
  late ButtonType type ;

  CustomButton({required this.value , required this.isDarkTheme}) {
    type = getbuttonTypeByValue()!;
    setColorByButtonType(
      buttonType : type
    );
  }

  setColorByButtonType({required ButtonType buttonType}) {
    switch (buttonType) {
      case ButtonType.numbers:
        setColorForSimpleButtons();
        break;
      case ButtonType.operator:
        setColorForOperatorsButtons();
        break;
      case ButtonType.actions:
        setColorForActionsButtons();
        break;
      default:
    }
  }

  ButtonType? getbuttonTypeByValue(){
    Set<String> numbers = {'1','2','3','4','5','6','7','8','9','0','.','ANS'};
    Set<String> operators = {'+','/','x','-','%'};
    Set<String> actions = {'C','DEL','='};
    if (numbers.contains(value)) return ButtonType.numbers ;
    if (operators.contains(value)) return ButtonType.operator ;
    if (actions.contains(value)) return ButtonType.actions ;
    return null ;
  }

  void setColorForActionsButtons() {
    color = isDarkTheme ? const Color.fromARGB(255, 33, 36, 42) : const Color.fromARGB(255, 243, 243, 243);
    bgColor = isDarkTheme ? const Color.fromARGB(255, 7, 255, 209) : const Color.fromARGB(255, 1, 157, 128);
  }

  void setColorForSimpleButtons() {
    color = isDarkTheme ?  Colors.white : Colors.black;
    bgColor = isDarkTheme ? Colors.black : Colors.white;
  }

  void setColorForOperatorsButtons() {
    color = isDarkTheme ? const Color.fromARGB(255, 243, 243, 243) :  const Color.fromARGB(255, 243, 243, 243)  ;
    bgColor = isDarkTheme ? Colors.deepPurpleAccent  :  Colors.deepPurpleAccent   ;
  }
}

enum ButtonType { actions, numbers, operator }