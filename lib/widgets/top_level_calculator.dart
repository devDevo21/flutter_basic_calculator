import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic_calculator/state_manager/calculator_provider.dart';
import 'package:flutter_basic_calculator/widgets/input_screen_widget.dart';
import 'package:flutter_basic_calculator/widgets/output_screen_widget.dart';
import 'package:flutter_basic_calculator/widgets/switch_theme_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopLevelCalculator extends ConsumerWidget {
  const TopLevelCalculator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: ref.watch(calculatorProvider).isDarkTheme ? Colors.black : Colors.white ,
        ),
        width: maxWidth,
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSwitchTheme(),
              InputScreen(),
              OutputScreen()
            ],
          ),
        ),
      ),
    );
  }
}
