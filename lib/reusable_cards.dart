import 'package:flutter/material.dart';

class ReusableCards extends StatefulWidget {
  @override
  _ReusableCardsState createState() => _ReusableCardsState();
  ReusableCards({this.gradientActive, this.child, this.changeState});
  Gradient gradientActive;
  Widget child;
  Function changeState;
}

class _ReusableCardsState extends State<ReusableCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.changeState();
      },
      child: Container(
        child: widget.child,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: widget.gradientActive,
            boxShadow: [
              BoxShadow(
                  color: Color(0x2916222A),
                  spreadRadius: 10.0,
                  blurRadius: 10.0)
            ]),
      ),
    );
  }
}
