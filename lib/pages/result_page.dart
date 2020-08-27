import 'package:expected_life_time/models/life_time.dart';
import 'package:expected_life_time/services/my_container.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  static const String routeName = '/result';

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    LifeTime lifeTime = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Expanded(
          child: MyContainer(
            color: Colors.grey[300],
            child: Text(lifeTime.sex),
          ),
        ),
      ),
    );
  }
}
