// ignore_for_file: file_names

import 'dart:math';

class MathCalculator {
  bool isValidOperation(String operation) {
    RegExp regExp = RegExp(r'^[\d\s\+\-\*\/\(\)cossintanlnlog]+$');
    return regExp.hasMatch(operation);
  }

  double calculate(String operation) {
    operation = operation.replaceAll(' ', '');
    List<double> operandStack = [];
    List<String> operatorStack = [];

    for (int i = 0; i < operation.length; i++) {
      String char = operation[i];
      if (char == '(') {
        if (i > 0 && '0123456789)'.contains(operation[i - 1])) {
          operatorStack.add('*');
        }
        operatorStack.add(char);
      } else if (char == ')') {
        while (operatorStack.last != '(') {
          calculateTopOperator(operandStack, operatorStack);
        }
        operatorStack.removeLast();
      } else if ('0123456789.'.contains(char)) {
        int endIndex = i + 1;
        while (endIndex < operation.length &&
            '0123456789.'.contains(operation[endIndex])) {
          endIndex++;
        }
        String operand = operation.substring(i, endIndex);
        operandStack.add(double.parse(operand));
        i = endIndex - 1;
      } else {
        while (operatorStack.isNotEmpty &&
            precedence(operatorStack.last) >= precedence(char)) {
          calculateTopOperator(operandStack, operatorStack);
        }
        operatorStack.add(char);
      }
    }

    while (operatorStack.isNotEmpty) {
      calculateTopOperator(operandStack, operatorStack);
    }

    return operandStack.last;
  }

  void calculateTopOperator(
      List<double> operandStack, List<String> operatorStack) {
    String operator = operatorStack.removeLast();
    double result;
    if (operator == 'cos' || operator == 'sin' || operator == 'tan') {
      double operand = operandStack.removeLast();
      result = trigonometricFunction(operator, operand);
    } else if (operator == 'ln' || operator == 'log') {
      double operand = operandStack.removeLast();
      result = logarithmicFunction(operator, operand);
    } else if (operator == 'abs') {
      double operand = operandStack.removeLast();
      result = operand.abs();
    } else {
      double operand2 = operandStack.removeLast();
      double operand1 = operandStack.removeLast();
      switch (operator) {
        case '*':
          result = operand1 * operand2;
          break;
        case '/':
          if (operand2 == 0) {
            throw ArgumentError("Division par zéro !");
          }
          result = operand1 / operand2;
          break;
        case '+':
          result = operand1 + operand2;
          break;
        case '-':
          result = operand1 - operand2;
          break;
        default:
          throw ArgumentError("Opérateur non pris en charge : $operator");
      }
    }
    operandStack.add(result);
  }

  double trigonometricFunction(String operator, double operand) {
    double angleInRadians = operand * pi / 180;
    switch (operator) {
      case 'cos':
        return cos(angleInRadians);
      case 'sin':
        return sin(angleInRadians);
      case 'tan':
        return tan(angleInRadians);
      default:
        throw ArgumentError(
            "Fonction trigonométrique non prise en charge : $operator");
    }
  }

  double logarithmicFunction(String operator, double operand) {
    if (operand <= 0) {
      throw ArgumentError("L'opérande doit être strictement positif");
    }
    switch (operator) {
      case 'ln':
        return log(operand);
      case 'log':
        return log(operand) / log(10);
      default:
        throw ArgumentError(
            "Fonction logarithmique non prise en charge : $operator");
    }
  }

  int precedence(String operator) {
    switch (operator) {
      case '(':
        return 0;
      case '+':
      case '-':
        return 1;
      case '*':
      case '/':
        return 2;
      case 'cos':
      case 'sin':
      case 'tan':
      case 'ln':
      case 'log':
      case 'abs':
        return 3;
      default:
        throw ArgumentError("Opérateur non pris en charge : $operator");
    }
  }
}
