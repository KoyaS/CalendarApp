import 'package:CalendarApp/ProjectElement.dart';
import 'package:flutter/material.dart';
import 'ProjectDialog.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final listData = [
    {
      'projectTitle': 'Project 1',
      'taskList': [
        {'name': '1', 'completed': false},
        {'name': '2', 'completed': false},
        {
          'name': '1234567891112131415161718192021222324252627282930',
          'completed': false
        },
      ]
    },
    {
      'projectTitle': 'Project 2',
      'taskList': [
        {'name': '1', 'completed': false},
        {'name': '2', 'completed': false},
        {'name': '3', 'completed': false},
      ]
    },
    {
      'projectTitle': 'Project 3',
      'taskList': [
        {'name': '1', 'completed': false},
        {'name': '2', 'completed': false},
        {'name': '3', 'completed': false},
      ]
    },
  ];

  ProjectDialog _projectDialog = new ProjectDialog();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.only(top: 440),
        children: <Widget>[
          Center(
            child: Text(
              'PROJECTS',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
          ),
          for (int projectIndex
              in Iterable<int>.generate(listData.length).toList())
            ProjectElement(
              title: listData[projectIndex]['projectTitle'],
              tasks: listData[projectIndex]['taskList'],
              // key: Key(listData[projectIndex]['projectTitle']),
              key: Key(projectIndex.toString()),
              moveListFunc: moveListItem,
              projectIndex: projectIndex,
            ),
          Padding(
              padding: EdgeInsets.only(top: 30, bottom: 50),
              child: RaisedButton(
                elevation: 5,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) => _projectDialog,
                        fullscreenDialog: true,
                      ));
                },
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                shape: CircleBorder(),
              )),
        ],
      ),
    );
  }

  void moveListItem(String direction, int index) {
    if (direction == 'up') {
      if (index > 0) {
        setState(() {
          var tempHolder = listData[index - 1];
          listData[index - 1] = listData[index];
          listData[index] = tempHolder;
        });
      } else {
        setState(() {}); // Rebuilds view so box isn't dismissed
      }
    } else if (direction == 'down') {
      if (index != listData.length - 1) {
        setState(() {
          var tempHolder = listData[index + 1];
          listData[index + 1] = listData[index];
          listData[index] = tempHolder;
        });
      } else {
        setState(() {});
      }
    }
  }
}
