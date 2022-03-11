import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:organization_app/stuff/mockroutines.dart';

class RoutinePage extends StatefulWidget {
  @override
  _RoutinePageState createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  late CountdownTimerController controller;
  int endTime = Duration(seconds: 30).inMilliseconds;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: null);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: Container(
        child: Column(children: [
          Expanded(
            child: Align(
                alignment: Alignment.center,
                child: CountdownTimer(
                    controller: controller,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return Text('0');
                      }
                      return Text('${time.min}');
                    })),
          )
        ]),
      )),
    );
  }
}
