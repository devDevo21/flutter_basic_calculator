import 'package:flutter/material.dart';
import 'package:flutter_basic_calculator/models/custom_button.dart';
import 'package:flutter_basic_calculator/state_manager/calculator_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomBttomWidget extends ConsumerWidget {
  final CustomButton customButton;
  const CustomBttomWidget({super.key, required this.customButton});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void printNumbersToScreen(value) {
      ref.read(calculatorProvider).setInputValue(value);
    }

    void printOperatorToScreen(value) {
      ref.read(calculatorProvider).printOperatorToScreen(value);
    }

    void clearSreen() {
      ref.read(calculatorProvider).resetScreen();
    }

    void delCharacter() {
      ref.read(calculatorProvider).delCharacter();
    }

    void showResult() {
      ref.read(calculatorProvider).showResult();
    }

    void performeAction(String value) {
      switch (value) {
        case 'C':
          clearSreen();
          break;
        case 'DEL':
          delCharacter();
          break;
        case '=':
          showResult();
          break;
        default:
      }
    }

    onTapButton(ButtonType choice, String value) {
      switch (choice) {
        case ButtonType.numbers:
          printNumbersToScreen(value);
          break;
        case ButtonType.operator:
          printOperatorToScreen(value);
          break;
        case ButtonType.actions:
          performeAction(value);
          break;
        default:
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onTapButton(customButton.type, customButton.value);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: customButton.bgColor, shape: BoxShape.circle),
          child: Text(
            customButton.value,
            style: TextStyle(
                color: customButton.color,
                fontSize: 28,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
