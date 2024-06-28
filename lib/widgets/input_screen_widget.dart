import 'package:flutter/material.dart';
import 'package:flutter_basic_calculator/state_manager/calculator_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputScreen extends ConsumerWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.centerRight,
      height: 100,
      width: double.infinity,
      child: FittedBox(
        child: Text(ref.watch(calculatorProvider).inputValue,
            style: TextStyle(
                fontSize: 55,
                color: ref.watch(calculatorProvider).isDarkTheme
                    ? Colors.white
                    : Colors.black)),
      ),
    );
  }
}
