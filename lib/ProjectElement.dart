import 'package:CalendarApp/CheckboxTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProjectElement extends StatelessWidget {
  final Key key;
  final String title;
  final List tasks;
  final Function moveListFunc;
  final int projectIndex;

  ProjectElement(
      {this.title, this.tasks, this.key, this.moveListFunc, this.projectIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: ClipRRect(
            child: Slidable(
                key: key,
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                secondaryActions: <Widget>[
                  IconSlideAction(
                    // caption: 'Move down',
                    color: Colors.white,
                    icon: Icons.arrow_downward,
                    onTap: () => moveListFunc('down', projectIndex),
                  ),
                  IconSlideAction(
                    // caption: 'Move up',
                    color: Colors.white,
                    icon: Icons.arrow_upward,
                    onTap: () => moveListFunc('up', projectIndex),
                  ),
                ],
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              title,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: null,
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                        for (var task in tasks)
                          CheckboxTask(
                              taskName: task['name'],
                              completionStatus: task['completed']),
                      ],
                    )))),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ));
  }
}
