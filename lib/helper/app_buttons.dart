import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import '../pages/result.dart';

class ResultSaverButtons extends StatelessWidget {
  const ResultSaverButtons({
    required this.onPress,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        height: 50,
        width: double.infinity, //for width up to size.
        // margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Center(
              child: Text(
                buttonText,
                style: kLargeButtonTextStyle,
              ),
            ),
            Divider(
              indent: 100,
              endIndent: 100,
              height: 10,
              thickness: 3,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
