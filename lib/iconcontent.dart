import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.textColor, this.label});
  final IconData icon;
  final String label;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: textColor, fontSize: 20);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: textColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: style,
        ),
      ],
    );
  }
}
