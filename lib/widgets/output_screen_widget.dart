import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic_calculator/state_manager/calculator_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OutputScreen extends ConsumerWidget {
  const OutputScreen({super.key});

  String realToInt(String value) {
    return value.split('.0').first;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outputValue = ref.watch(calculatorProvider).outputValue;
    return Container(
      width: double.infinity,
      height: 80,
      alignment: Alignment.centerRight,
      child: Text(realToInt(outputValue),
          style: TextStyle(
              fontSize: 60,
              color: ref.watch(calculatorProvider).isDarkTheme
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold)),
    );
  }
}
