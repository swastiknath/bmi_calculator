import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculatorBrain.dart';
import 'iconcontent.dart';
import 'resultPage.dart';
import 'reusable_cards.dart';

void main() => runApp(bmicalc());
enum Gender { male, female, None }
Gender selectedGender = Gender.None;
BuildContext globalContext;
Gradient inactiveGradCol = RadialGradient(
    center: Alignment.topLeft,
    radius: 0.7,
    colors: [Color(0xff3A6073), Color(0xff16222A)]);
Color maleTextColor = Colors.grey;
double height = 181;
double weight = 68;
double age = 19;
Color femaleTextColor = Colors.grey;
Gradient activeGradCol = RadialGradient(
    center: Alignment.centerRight,
    radius: 0.7,
    colors: [Color(0xff26D0CE), Color(0xff16222A)]);
CalculatorBrain calc;
void openDrawer(BuildContext context) {
  Scaffold.of(context).openDrawer();
}

class bmicalc extends StatefulWidget {
  @override
  _bmiCalcState createState() => _bmiCalcState();
}

// ignore: camel_case_types
class _bmiCalcState extends State<bmicalc> {
  Gradient maleGradCol = inactiveGradCol;
  Gradient femaleGradCol = inactiveGradCol;

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey[900],
      ),
      routes: {
        '/result': (context) => resultPage(
              bmi: calc.calculateBMI(),
              bmiresult: calc.resultBMI()[0],
              bmidesc: calc.resultBMI()[1],
            )
      },
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 30.0, 10.0, 10.0),
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    "Version: 1.0.9+bugfix2.3.0",
                    style: TextStyle(letterSpacing: 3.0),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.white,
                        indent: 30.0,
                        endIndent: 30.0,
                      ),
                      Center(
                        child: Text(
                          "ABOUT BMI CALCULATOR",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Text(
                        "Designed by SwastikNath Group Holdings at Navi Mumbai, India.",
                        style: TextStyle(
                            letterSpacing: 2.5, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 3,
          leading: appBarDrawerButton(),
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(letterSpacing: 2.0, color: Colors.white),
          ),
        ),
        body: createHomeLayout(
          maleGradCol: maleGradCol,
          femaleGradCol: femaleGradCol,
        ),
      ),
    );
  }
}

class appBarDrawerButton extends StatelessWidget {
  const appBarDrawerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.drag_handle),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}

class RoundedButtons extends StatelessWidget {
  RoundedButtons({this.children, this.fillColor, this.onPressed});
  Widget children;
  Color fillColor;
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      child: children,
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: fillColor,
      splashColor: Colors.pink,
    );
  }
}

class createHomeLayout extends StatefulWidget {
  @override
  _createHomeLayoutState createState() => _createHomeLayoutState();
  createHomeLayout({this.maleGradCol, this.femaleGradCol});
  Gradient maleGradCol, femaleGradCol;
}

class _createHomeLayoutState extends State<createHomeLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCards(
                    gradientActive: widget.maleGradCol,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                      textColor: maleTextColor,
                    ),
                    changeState: () {
                      setState(() {
                        if (widget.maleGradCol != activeGradCol) {
                          widget.maleGradCol = activeGradCol;
                          maleTextColor = Colors.white;
                          selectedGender = Gender.male;
                          widget.femaleGradCol = inactiveGradCol;
                          femaleTextColor = Colors.grey;
                        } else {
                          widget.maleGradCol = inactiveGradCol;
                          maleTextColor = Colors.grey;
                          selectedGender = Gender.None;
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCards(
                    gradientActive: widget.femaleGradCol,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                      textColor: femaleTextColor,
                    ),
                    changeState: () {
                      setState(() {
                        if (widget.femaleGradCol != activeGradCol) {
                          widget.femaleGradCol = activeGradCol;
                          femaleTextColor = Colors.white;
                          widget.maleGradCol = inactiveGradCol;
                          selectedGender = Gender.female;
                          maleTextColor = Colors.grey;
                        } else {
                          widget.femaleGradCol = inactiveGradCol;
                          femaleTextColor = Colors.grey;
                          selectedGender = Gender.None;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCards(
              gradientActive: activeGradCol,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.round().toString(),
                        style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.pink,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 20.0,
                          pressedElevation: 10.0,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x2993F9B9)),
                    child: Slider(
                      value: height.round().toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round().toDouble();
                        });
                      },
                      min: 90,
                      max: 260,
                      autofocus: false,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCards(
                    gradientActive: activeGradCol,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 20, letterSpacing: 3.0),
                        ),
                        Text(
                          weight.round().toString(),
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButtons(
                              fillColor: Color(0xff3A6073),
                              children: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (weight < 250) {
                                    weight++;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButtons(
                              fillColor: Color(0xff3A6073),
                              children: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (weight > 10) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCards(
                    gradientActive: activeGradCol,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 3.0,
                          ),
                        ),
                        Text(
                          age.round().toString(),
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButtons(
                              fillColor: Color(0xff3A6073),
                              children: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (age <= 100) {
                                    age++;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButtons(
                              fillColor: Color(0xff3A6073),
                              children: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print(selectedGender);
              if (selectedGender != Gender.None) {
                calc = CalculatorBrain(height: height, weight: weight);
                Navigator.of(context).pushNamed('/result');
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "PLEASE SELECT YOUR GENDER TO CONTINUE",
                      style: TextStyle(letterSpacing: 2.5),
                      textAlign: TextAlign.center,
                    ),
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                );
              }
            },
            child: Container(
              // margin: EdgeInsets.all(5.0),
              // padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.centerRight,
                  radius: 10,
                  colors: [
                    Color(0xff1F1C18),
                    Color(0xff8E0E00),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
