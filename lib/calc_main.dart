import 'package:calaulator_app_ui/button_value.dart';
import 'package:flutter/material.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalculatorHome> {
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
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 10),
                  height: 130,
                  width: double.infinity,
                  child: Text('0', style: TextStyle(
                    fontSize: 50, 
                    fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                    ),
                ),
              ),
            ),

            //Buttons
            Wrap(
              children: Btn.buttonValues.map((e) {
                // Example: assign color based on value
                Color buttonColor;
                if (e == 'C' || e == 'D') {
                  buttonColor = Colors.blue;
                } else if (e == '-'|| e == '+'|| e == '÷'|| e == '×'|| e == '%') {
                  buttonColor = Colors.green;
                } else if (e == '=') {
                  buttonColor = Colors.red;
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
                        side: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}