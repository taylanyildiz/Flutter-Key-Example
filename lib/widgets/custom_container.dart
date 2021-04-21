import 'dart:math';

import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final String title;
  CustomContainer({
    Key key,
    @required this.title,
  }) : super(key: key);
  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  Color color;
  @override
  void initState() {
    super.initState();
    color = generateColor();
  }

  Color generateColor() {
    final random = Random();
    return Color.fromARGB(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200.0,
        color: color,
        child: Center(
            child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        )),
      ),
    );
  }
}
