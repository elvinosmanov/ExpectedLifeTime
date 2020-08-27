import 'dart:async';

import 'package:expected_life_time/models/life_time.dart';
import 'package:expected_life_time/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:expected_life_time/services/my_container.dart';
import 'package:expected_life_time/services/icon_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expected_life_time/services/constants.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer timer;
  LifeTime lifeTime = LifeTime();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        // backgroundColor: Colors.lightBlue[700],
        title: Text("EXPECTED LIFE TIME"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: MyContainer(
                    child: buildMyRow('BOY'),
                  )),
                  Expanded(
                      child: MyContainer(
                    child: buildMyRow('WEIGHT'),
                  )),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("How many do sport in a week?", style: textStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    lifeTime.sportDay.toString(),
                    style: numberStyle,
                  ),
                  Slider(
                    min: 0,
                    max: 7.0,
                    divisions: 7,
                    value: lifeTime.sportDay.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        lifeTime.sportDay = value.round();
                      });
                    },
                  ),
                ],
              )),
            ),
            Expanded(
              child: MyContainer(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("How many sigarettes do you smoke in day?",
                      style: textStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text(lifeTime.sigaretteNum.toString(), style: numberStyle),
                  Slider(
                    min: 0,
                    max: 30.0,
                    value: lifeTime.sigaretteNum.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        lifeTime.sigaretteNum = value.round();
                      });
                    },
                  ),
                ],
              )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        lifeTime.sex = 'FEMALE';
                      });
                    },
                    child: MyContainer(
                      color: lifeTime.sex == 'FEMALE'
                          ? Colors.lightBlue[900]
                          : Colors.white,
                      child: IconContainer(
                        icon: FontAwesomeIcons.venus,
                        title: "FEMALE",
                      ),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        lifeTime.sex = 'MALE';
                      });
                    },
                    child: MyContainer(
                      color: lifeTime.sex == 'MALE'
                          ? Colors.lightBlue[900]
                          : Colors.white,
                      child: IconContainer(
                        icon: FontAwesomeIcons.mars,
                        title: "MALE",
                      ),
                    ),
                  )),
                ],
              ),
            ),
            MyContainer(
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, ResultPage.routeName,
                      arguments: lifeTime);
                },
                child: Text(
                  "CALCULATE",
                  style: textStyle,
                ),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildMyRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            title,
            style: textStyle,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: -1,
            child: Text(
                title == 'BOY'
                    ? lifeTime.height.toString()
                    : lifeTime.weight.toString(),
                style: numberStyle)),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
                minWidth: 40,
                child: OutlineButton(
                  onPressed: () {
                    setState(() {
                      title == 'BOY' ? lifeTime.height++ : lifeTime.weight++;
                    });
                  },
                  borderSide: BorderSide(color: Colors.blue),
                  child: Text(
                    "+",
                    style: textStyle,
                  ),
                )),
            ButtonTheme(
                minWidth: 40,
                child: OutlineButton(
                  onPressed: () {
                    setState(() {
                      title == 'BOY' ? lifeTime.height-- : lifeTime.weight--;
                    });
                  },
                  borderSide: BorderSide(color: Colors.blue),
                  child: Text(
                    "-",
                    style: textStyle,
                  ),
                )),
          ],
        )
      ],
    );
  }
}
