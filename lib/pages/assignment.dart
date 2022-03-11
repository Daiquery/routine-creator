import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Create'),
      ),
      child: SafeArea(
          child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Title'),
                ),
                Expanded(
                  child: CupertinoTextField(
                    placeholder: 'Title',
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
