import 'package:calaulator_app_ui/button_value.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalculatorHome> {
  String input = '';
  String result = '0';

  String _evaluate(String expr) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expr.replaceAll('×', '*').replaceAll('÷', '/'));
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            //Output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 10),
                  height: 130,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(input, style: const TextStyle(fontSize: 32)),
                      Text(result, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),

            //Buttons
            Wrap(
              children: Btn.buttonValues.map((e) {
                Color buttonColor;
                if (e == 'C' || e == 'D') {
                  buttonColor = Colors.blue;
                } else if (e == '-'|| e == '+'|| e == '÷'|| e == '×'|| e == '%' || e == '()') {
                  buttonColor = Colors.green;
                } else if (e == '=') {
                  buttonColor = Colors.deepOrangeAccent;
                } else {
                  buttonColor = Colors.black54;
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                        side: const BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    onPressed: () {
                      setState((){
                        if (e == 'C'){
                          input = '';
                          result = '0';
                        } else if (e == 'D'){
                          if (input.isNotEmpty){
                            input = input.substring(0, input.length - 1);
                          }
                        } else if (e == '='){
                          result = _evaluate(input);
                        } else {
                          input += e;
                        }
                      });
                    },
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}