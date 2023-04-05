import 'package:flutter/cupertino.dart';

class Iconcontent extends StatelessWidget {
  const Iconcontent({
    required this.iconSelect,
    required this.Gender,
    Key? key, 
  }) : super(key: key);
  final IconData iconSelect;
  final Text Gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconSelect,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Gender,
      ],
    );
  }
}
