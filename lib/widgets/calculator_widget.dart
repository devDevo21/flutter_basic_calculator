import 'package:flutter/material.dart';
import 'package:flutter_basic_calculator/widgets/bottom_level_calculator.dart';
import 'package:flutter_basic_calculator/widgets/top_level_calculator.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
      child: Column(children: [
        TopLevelCalculator(),
        BottomLevelCalculator()
      ]),
    ),
    );
  }
}
