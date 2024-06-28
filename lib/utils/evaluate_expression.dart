import 'package:math_expressions/math_expressions.dart';

double evaluateStringExpression(String value) {
  try {
    final ContextModel cm = ContextModel();
    Parser p = Parser();
    Expression exp = p.parse(value);
    dynamic evaluation = exp.evaluate(EvaluationType.REAL, cm);
    return evaluation;
  } catch (e) {
    return throw Exception("Erreur d'evaluation");
  }
}
