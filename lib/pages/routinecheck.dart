import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organization_app/pages/assignment.dart';
import 'package:organization_app/pages/routinepage.dart';
import 'package:organization_app/stuff/mockroutines.dart';

class RoutineCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Morning Routine'),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: routines[0].tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return CupertinoListTile(
                    title: Text('${routines[0].tasks[index].title}'),
                    subtitle: Text(
                        '${routines[0].tasks[index].duration.inMinutes} minutes'),
                  );
                }),
          ),
          Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CupertinoButton(
                    child: Text('Begin'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RoutinePage()),
                      );
                    },
                  )))
        ],
      )),
    );
  }
}
