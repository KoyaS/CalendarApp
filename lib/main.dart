import 'package:CalendarApp/ProjectList.dart';
import 'package:CalendarApp/TimeFrame.dart';
import 'package:CalendarApp/TitleSection.dart';
import 'package:flutter/material.dart';

// TODO: Two projects cannot have the same name
// TODO: Fix grey rectangle while rearranging reorderable listview

// USED LIBRARIES:
// List slide menu: https://github.com/letsar/flutter_slidable
// Calendar month view https://github.com/dooboolab/flutter_calendar_carousel
// Calendar day view https://github.com/Skyost/FlutterWeekView

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // fontFamily: 'Georgia'
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopHeader('1.2.2020'),
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            ProjectList(),
            Container(child: TimeFrame(), alignment: AlignmentDirectional.topCenter,),
          ],
        ),
        decoration: new BoxDecoration(color: Colors.white),
      ),
    );
  }
}
