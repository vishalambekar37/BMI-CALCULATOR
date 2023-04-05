
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reuseblecard extends StatelessWidget {
  const Reuseblecard({
    required this.colour,
    required this.ContChild,
  });
  final Widget ContChild;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colour,
      ),
      height: 200,
      child: ContChild,
    );
  }
}
