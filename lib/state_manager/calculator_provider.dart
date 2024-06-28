
import 'package:flutter_basic_calculator/state_manager/calculator_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final calculatorProvider = ChangeNotifierProvider((ref) => CalculatorModel());