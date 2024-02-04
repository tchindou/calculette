// ignore_for_file: prefer_final_fields, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:calculette/logics/calcul_solver.dart';

String operation = "";
double result = 0;
String resultError = "";

class Calcul extends StatefulWidget {
  const Calcul({Key? key}) : super(key: key);

  @override
  _CalculState createState() => _CalculState();
}

class _CalculState extends State<Calcul> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _control = TextEditingController();

  @override
  void initState() {
    super.initState();
    _control.text = '0';
  }

  void setIndex(int newIndex) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Ecran(
          context: context,
          controller: _controller,
          control: _control,
        ).ecran(),
        Expanded(child: Container()),
        CalcPanel(
          context: context,
          controller: _controller,
          control: _control,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class Ecran extends Container {
  BuildContext context;
  TextEditingController controller;
  TextEditingController control;

  Ecran({
    Key? key,
    required this.context,
    required this.controller,
    required this.control,
  }) : super(key: key);

  Container ecran() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
          top: 40, left: MediaQuery.of(context).size.width * 0.02),
      width: MediaQuery.of(context).size.width * 0.96,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xffEFEBEA),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black87,
          width: 0.1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                alignment: Alignment.topLeft,
                height: 100,
                width: MediaQuery.of(context).size.width * 0.96,
                child: TextField(
                  controller: controller,
                  focusNode: FocusNode(
                    canRequestFocus: false,
                    descendantsAreFocusable: false,
                  ),
                  showCursor: true,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 36,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              )),
          Container(
            alignment: Alignment.bottomRight,
            height: 40,
            child: TextField(
              controller: control,
              autofocus: false,
              readOnly: true,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CalcPanel extends StatefulWidget {
  BuildContext context;
  TextEditingController controller;
  TextEditingController control;

  CalcPanel({
    Key? key,
    required this.context,
    required this.controller,
    required this.control,
  }) : super(key: key);

  @override
  _CalcPanelState createState() => _CalcPanelState();
}

class _CalcPanelState extends State<CalcPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(top: 48),
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1.35,
        children: [
          CalculatorButton(
            text: 'X^Y',
            onPressed: () {
              widget.controller.text += "^";
            },
            index: 2,
          ),
          CalculatorButton(
            text: 'ln',
            onPressed: () {
              widget.controller.text += "ln(";
            },
            index: 2,
          ),
          CalculatorButton(
            text: 'log',
            onPressed: () {
              widget.controller.text += "log(";
            },
            index: 2,
          ),
          CalculatorButton(
            text: '√(',
            onPressed: () {
              widget.controller.text += "sqrt(";
            },
            index: 2,
          ),
          CalculatorButton(
            text: 'abs',
            onPressed: () {
              widget.controller.text += "abs(";
            },
            index: 2,
          ),
          CalculatorButton(
            text: 'sin',
            onPressed: () {
              widget.controller.text += "sin(";
            },
            index: 2,
          ),
          CalculatorButton(
            text: 'cos',
            onPressed: () {
              widget.controller.text += "cos(";
            },
            index: 2,
          ),
          CalculatorButton(
            text: 'tan',
            onPressed: () {
              widget.controller.text += "tan(";
            },
            index: 2,
          ),
          CalculatorButton(
            text: '(',
            onPressed: () {
              widget.controller.text += "(";
            },
            index: 2,
          ),
          CalculatorButton(
            text: ')',
            onPressed: () {
              widget.controller.text += ")";
            },
            index: 2,
          ),
          CalculatorButton(
            text: 'π',
            onPressed: () {
              widget.controller.text += "pi";
            },
            index: 2,
          ),
          CalculatorButton(
            text: 'DEL',
            onPressed: () {
              String str = widget.controller.text;
              (str.isNotEmpty)
                  ? str = str.substring(0, str.length - 1)
                  : str = "";
              widget.controller.text = str;
            },
            index: 1,
          ),
          CalculatorButton(
            text: '7',
            onPressed: () {
              widget.controller.text += "7";
            },
            index: 0,
          ),
          CalculatorButton(
            text: '8',
            onPressed: () {
              widget.controller.text += "8";
            },
            index: 0,
          ),
          CalculatorButton(
            text: '9',
            onPressed: () {
              widget.controller.text += "9";
            },
            index: 0,
          ),
          CalculatorButton(
            text: '/',
            onPressed: () {
              widget.controller.text += "/";
            },
            index: 3,
          ),
          CalculatorButton(
            text: '4',
            onPressed: () {
              widget.controller.text += "4";
            },
            index: 0,
          ),
          CalculatorButton(
            text: '5',
            onPressed: () {
              widget.controller.text += "5";
            },
            index: 0,
          ),
          CalculatorButton(
            text: '6',
            onPressed: () {
              widget.controller.text += "6";
            },
            index: 0,
          ),
          CalculatorButton(
            text: 'x',
            onPressed: () {
              widget.controller.text += "*";
            },
            index: 3,
          ),
          CalculatorButton(
            text: '1',
            onPressed: () {
              widget.controller.text += "1";
            },
            index: 0,
          ),
          CalculatorButton(
            text: '2',
            onPressed: () {
              widget.controller.text += "2";
            },
            index: 0,
          ),
          CalculatorButton(
            text: '3',
            onPressed: () {
              widget.controller.text += "3";
            },
            index: 0,
          ),
          CalculatorButton(
            text: '-',
            onPressed: () {
              widget.controller.text += "-";
            },
            index: 3,
          ),
          CalculatorButton(
            text: '0',
            onPressed: () {
              widget.controller.text += "0";
            },
            index: 0,
          ),
          CalculatorButton(
            text: '.',
            onPressed: () {
              widget.controller.text += ".";
            },
            index: 3,
          ),
          CalculatorButton(
            text: '=',
            onPressed: () {
              try {
                result = MathCalculator().calculate(widget.controller.text);

                // Limiter le résultat à trois chiffres après la virgule
                String resultString = result.toStringAsFixed(3);

                // Convertir en double pour vérifier la partie décimale
                double parsedResult = double.parse(resultString);
                if (parsedResult % 1 == 0) {
                  resultString = parsedResult
                      .toInt()
                      .toString(); // Convertir en entier si la partie décimale est zéro
                }

                widget.controller.text = resultString;
                widget.control.text = resultString;
              } catch (e) {
                resultError = e.toString();
                widget.control.text = "[Al detecte une erreur]";
              }
            },
            index: 1,
          ),
          CalculatorButton(
            text: '+',
            onPressed: () {
              widget.controller.text += "+";
            },
            index: 3,
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final int index;

  const CalculatorButton({
    required this.text,
    required this.onPressed,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color txtColor;

    if (index == 0) {
      buttonColor = Colors.grey[300]!;
      txtColor = Colors.grey[900]!;
    } else if (index == 1) {
      buttonColor = Colors.orange[700]!;
      txtColor = Colors.red;
    } else if (index == 2) {
      buttonColor = Colors.grey[800]!;
      txtColor = Colors.white;
    } else {
      buttonColor = Colors.grey[900]!;
      txtColor = Colors.white;
    }

    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 5,
        right: 5,
        left: 5,
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(7),
          topRight: Radius.circular(7),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4.0,
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24.0,
                color: txtColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
