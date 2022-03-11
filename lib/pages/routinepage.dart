import 'dart:async';

import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:organization_app/domain/formatfunc.dart';
import 'package:organization_app/pages/routinecheck.dart';
import 'package:organization_app/pages/routineview.dart';
import 'package:organization_app/stuff/mockroutines.dart';

class RoutinePage extends StatefulWidget {
  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  late Timer _timer;
  int currentTask = 0;
  Duration _end = routines[0].tasks[0].duration;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void nextTask() {
    if (currentTask < routines[0].tasks.length - 1) {
      currentTask++;
      _end = routines[0].tasks[currentTask].duration + Duration(seconds: 1);
    } else {
      dispose();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RoutineViewPage()),
      );
    }
  }

  void startTimer() {
    _timer = new Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_end == Duration(seconds: 0)) {
            nextTask();
          } else {
            _end = _end - Duration(seconds: 1);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: Container(
        child: Column(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${formatDuration(_end)}",
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 100,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${routines[0].tasks[currentTask].title}",
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 40,
                      )),
                ],
              )
            ],
          ),
          Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CupertinoButton(
                    child: const Icon(
                      CupertinoIcons.chevron_right_circle_fill,
                      color: CupertinoColors.activeBlue,
                      size: 100.0,
                    ),
                    onPressed: () {
                      nextTask();
                    },
                  )))
        ]),
      )),
    );
  }
}
