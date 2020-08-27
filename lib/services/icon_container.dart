import 'package:flutter/material.dart';

import 'constants.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  IconContainer({@required this.icon, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 45.0,
          color: Colors.grey,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          this.title,
          style: textStyle,
        ),
      ],
    );
  }
}
