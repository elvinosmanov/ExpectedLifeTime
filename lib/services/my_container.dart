import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width;
  final double height;
  MyContainer({this.child, this.color = Colors.white, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: this.child,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: this.color),
    );
  }
}
