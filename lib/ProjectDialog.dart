import 'package:CalendarApp/TextInput.dart';
import 'package:flutter/material.dart';

class ProjectDialog extends StatefulWidget {
  String title;
  List taskList = ['task', 'flask', 'bask', 'et'];
  List<TextInput> taskWidgets = [];

  TextInput titleInput = new TextInput(
    fillerText: "doesn't matter",
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
    customDecoration: true,
    inputDecoration: InputDecoration(
      hintText: 'Title',
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    ),
  );

  @override
  ProjectDialogState createState() => new ProjectDialogState();
}

class ProjectDialogState extends State<ProjectDialog> {
  void AddTask() {
    setState(() {
      var counter = 0;
      for (TextInput widge in widget.taskWidgets) {
        widget.taskList[counter] = widge.controller.text;
        counter++;
      }
      widget.taskList.add('');
      widget.title = widget.titleInput.controller.text;
    });
  }

  void CreateTaskWidgets() {
    var oldTaskList = new List.from(widget.taskList);
    widget.taskWidgets = [];
    for (int taskIndex
        in Iterable<int>.generate(widget.taskList.length).toList()) {
      if (widget.taskList[taskIndex] != '' ||
          taskIndex == widget.taskList.length - 1) {
        widget.taskWidgets.add(TextInput(
          fillerText: 'doesn"t matter',
          customDecoration: true,
          heldText: widget.taskList[taskIndex],
          inputDecoration: InputDecoration(
            hintText: 'To Do',
            prefixIcon: Icon(
              Icons.radio_button_unchecked,
              color: Colors.black,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ));
      } else {
        oldTaskList.removeAt(taskIndex);
      }
    }
    widget.taskList = oldTaskList;
  }

  @override
  Widget build(BuildContext context) {
    CreateTaskWidgets();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "New Project",
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: <Widget>[
            widget.titleInput,
            Expanded(
                child: ListView(
              children: <Widget>[
                ...widget.taskWidgets,
                FlatButton(
                    onPressed: AddTask, child: Text('Tap to add task...')),
              ],
            )),
            Align(
              alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35, right: 20),
              child:FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.check),
              backgroundColor: Colors.green,
            ),))
          ]),
        ));
  }
}
