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
                  color: Colors.grey.shade300,
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
              children: Btn.buttonValues.map((e) => SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                child: TextButton(
                  onPressed: () {},
                  child: Text(e, style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),),
                ),
              )).toList(),
            )
          ],
        ),
      ),
    );
  }
}