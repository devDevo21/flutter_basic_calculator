import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_basic_calculator/state_manager/calculator_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomSwitchTheme extends ConsumerWidget {
  const CustomSwitchTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.center,
      child: AdvancedSwitch(
        controller: ValueNotifier(ref.watch(calculatorProvider).isDarkTheme),
        activeImage: const AssetImage('assets/images/night_sky.jpg'),
        inactiveImage: const AssetImage('assets/images/day_sky.png'),
        activeChild: const Text('Dark'),
        inactiveChild: const Text('Light'),
        width: 85,
        height: 45,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        onChanged: (value) {
          ref.read(calculatorProvider).setTheme(value);
        },
      ),
    );
  }
}
