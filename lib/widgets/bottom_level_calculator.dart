import 'package:flutter/material.dart';
import 'package:flutter_basic_calculator/models/custom_button.dart';
import 'package:flutter_basic_calculator/state_manager/calculator_provider.dart';
import 'package:flutter_basic_calculator/widgets/customButton.widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomLevelCalculator extends ConsumerWidget {
  const BottomLevelCalculator({super.key});

  final List<String> buttons = const [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
            color: ref.watch(calculatorProvider).isDarkTheme
                ? const Color.fromARGB(255, 0, 0, 0)
                : const Color.fromARGB(255, 255, 255, 255),
          ),
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                  color: ref.watch(calculatorProvider).isDarkTheme
                      ? const Color(0xff22252D)
                      : const Color.fromARGB(255, 236, 235, 235),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: GridView.builder(
                padding: const EdgeInsets.all(5),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: buttons.length,
                itemBuilder: (BuildContext context, int index) {
                  final customBtnValue = buttons[index];
                  return CustomBttomWidget(
                    customButton: CustomButton(
                        value: customBtnValue,
                        isDarkTheme: ref.watch(calculatorProvider).isDarkTheme),
                  );
                  //CustomButton(value: value, isDarkTheme: isDarkTheme)
                },
              ),
            ),
          ),
        ));
  }
}
