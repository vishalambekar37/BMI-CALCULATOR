// import 'package:bmi_calculator/resultPage.dart';
import 'package:bmi/helper/calculate_brain.dart';
import 'package:bmi/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/helper/app_icons.dart';
import 'package:bmi/constant/app_constant.dart';
import 'package:bmi/helper/app_cards.dart';

import 'package:flutter/material.dart' hide Action;

import 'helper/app_buttons.dart';

int height = 180;
int Weight = 60;
int Age = 23;

enum Gender {
  male,
  female,
} // **Enumeration**:- it is use when more than one like true or false or other thing..

void main() {
  return runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Color(0xFF29e4e8),
    ),
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF29e4e8),
        title: Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Task_Page(),
    ),
  ));
}

class Task_Page extends StatefulWidget {
  const Task_Page({super.key});

  @override
  State<Task_Page> createState() => _Task_PageState();
}

class _Task_PageState extends State<Task_Page> {
  Color Ontapcolor = kInactivecolor;
  Gender? Selectedgender; // if we want to pass null value then use ?.

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Selectedgender = Gender.male;
                    });
                  },
                  child: Reuseblecard(
                    ContChild: Iconcontent(
                      Gender: Text(
                        'Male',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      iconSelect: FontAwesomeIcons.mars,
                    ),
                    colour: Selectedgender == Gender.male
                        ? kActivecolor
                        : kInactivecolor,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Selectedgender = Gender.female;
                    });
                  },
                  child: Reuseblecard(
                    ContChild: Iconcontent(
                        Gender: Text('Female', style: kTextstyle),
                        iconSelect: FontAwesomeIcons.venus),
                    colour: Selectedgender == Gender.female
                        ? kActivecolor
                        : kInactivecolor,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Reuseblecard(
            ContChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kParameterstyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline
                      .alphabetic, // it is use to make all component of row at equally baseline.
                  children: [
                    Text(
                      height.toString(),
                      style: kParameternumberStyle,
                    ),
                    Text(
                      'cm',
                      style: kTextstyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Colors.white70,
                    activeTrackColor: kActivecolor,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(
                        0x29EB1555), //0x__EB1555 shows capasity of color mean light to dark.
                    thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius:
                            15.0), //it increase the slider toggle size.
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ), //increase outer size of slider.
                  child: Slider(
                    value: height.toDouble(),
                    // activeColor: kActivecolor,
                    // inactiveColor: Colors.white70,
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            colour: Ontapcolor,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Reuseblecard(
                ContChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kParameterstyle,
                    ),
                    Text(
                      Weight.toString(),
                      style: kParameternumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            WeightIcon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                Weight--;
                              });
                            }),
                        SizedBox(
                          width: 15,
                        ),
                        RoundIconButton(
                          WeightIcon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              Weight++;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
                colour: Ontapcolor,
              ),
            ),
            Expanded(
              child: Reuseblecard(
                ContChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kParameterstyle,
                    ),
                    Text(
                      Age.toString(),
                      style: kParameternumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            WeightIcon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                Age--;
                              });
                            }),
                        SizedBox(
                          width: 15,
                        ),
                        RoundIconButton(
                          WeightIcon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              Age++;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
                colour: Ontapcolor,
              ),
            )
          ],
        ),
        ResultSaverButtons(
          buttonText: 'CALCULATE',
          onPress: () {
            CalculationBrain calc =CalculationBrain(height: height,weight: Weight);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => resultPage(
                    resultText: calc.getResult(),
                    bmiresult: calc.calculateBMI(),
                    interpretation:calc.getinterpretation() ,
                  ),
                ));
          },
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.WeightIcon, required this.onPressed});
  final Widget
      WeightIcon; //const value are use to store constant value, and final for
  final VoidCallback onPressed;  // we used voidcallback for onpressed.
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: WeightIcon,
      shape: CircleBorder(), //we can give rectangle shape also
      fillColor: kActivecolor,
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      elevation: 6.0,
      onPressed: onPressed,
    );
  }
}


// ElevatedButton(
//           onPressed: () => () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => resultPage(),
//                 ));
//           },