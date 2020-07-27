import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CheckboxTask extends StatefulWidget {
  bool completionStatus;
  String taskName;

  CheckboxTask({this.taskName, this.completionStatus});

  @override
  _CheckboxTaskState createState() => _CheckboxTaskState();
}

class _CheckboxTaskState extends State<CheckboxTask> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        actions: <Widget>[
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => {},
          )
        ],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Transform.scale(
              scale: 0.7,
              child: Checkbox(
                value: widget.completionStatus,
                onChanged: (bool newVal) => setState(() {
                  widget.completionStatus = newVal;
                }),
              ),
            ),
            Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
            child: Text(
              widget.taskName,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ));
  }
}
