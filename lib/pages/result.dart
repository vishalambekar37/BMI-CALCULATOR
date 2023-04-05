import 'package:bmi/helper/app_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/app_constant.dart';

dynamic FinalResult = 25.5;

class resultPage extends StatelessWidget {
  const resultPage(
      {super.key,
      required this.bmiresult,
      required this.resultText,
      required this.interpretation});

  final String bmiresult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF29e4e8),
      appBar: AppBar(
        backgroundColor: Color(0xFF29e4e8),
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'YOUR RESULT',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              color: kInactivecolor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmiresult,
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.all(40),
                    child: Text(
                      interpretation,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ResultSaverButtons(
              buttonText: "RE-CALCULATE",
              onPress: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
