import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organization_app/pages/assignment.dart';
import 'package:organization_app/pages/routinecheck.dart';
import 'package:organization_app/stuff/mockroutines.dart';

// final List routines = [
//   "Morning Routine",
//   "Workout Schedule",
//   "Bedtime Preparation",
// ];

class RoutineViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Routines'),
        automaticallyImplyLeading: false,
      ),
      child: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: routines.length,
                itemBuilder: (BuildContext context, int index) {
                  return CupertinoListTile(
                    title: Text('${routines[index].title}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RoutineCheckPage()),
                      );
                    },
                  );
                }),
          ),
          Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CupertinoButton(
                    child: const Icon(
                      CupertinoIcons.add_circled_solid,
                      color: CupertinoColors.activeBlue,
                      size: 100.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AssignmentPage()),
                      );
                    },
                  )))
        ],
      )),
    );
  }
}
