import 'package:flutter/material.dart';

class resultPage extends StatefulWidget {
  @override
  _resultPageState createState() => _resultPageState();
  resultPage({this.bmi, this.bmiresult, this.bmidesc});
  String bmi, bmiresult, bmidesc;
}

class _resultPageState extends State<resultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(letterSpacing: 3.0),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 40.0, 0.0, 0.0),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueGrey[800]),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 40.0),
                        child: Text(
                          widget.bmiresult,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.5),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.bmi,
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(20.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            widget.bmidesc,
                            style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 2.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              // margin: EdgeInsets.all(5.0),
              // padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                    center: Alignment.centerRight,
                    radius: 10,
                    colors: [Color(0xff1F1C18), Color(0xff8E0E00)]),
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
                      "RE-CALCULATE",
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
          )
        ],
      ),
    );
  }
}
