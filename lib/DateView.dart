import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

class DateView extends StatefulWidget {
  @override
  _DateViewState createState() => _DateViewState();
}

// Let's get two dates :
DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);
String dateText = '';

class _DateViewState extends State<DateView> {
  @override
  Widget build(BuildContext context) {
    List monthNames = ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                dateText,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),
            ),
            Expanded(
              child: DayView(
                date: now,
                userZoomable: true,
                scrollToCurrentTime: true,
                style: DayViewStyle(
                  dayBarTextStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  backgroundColor: Colors.white,
                  hoursColumnBackgroundColor: Colors.white,
                  dayBarBackgroundColor: Colors.white,
                  dayBarHeight: 0,
                  dateFormatter: (year, month, day) {
                    String date = monthNames[month-1] +
                        ' ' +
                        day.toString();
                        // '.' +
                        // year.toString();
                    dateText = date;
                    return date;
                  },
                  timeFormatter: (time) {
                    if (time.hour > 12) {
                      return (time.hour - 12).toString() + 'pm';
                    } else {
                      return time.hour.toString() + 'am';
                    }
                  },
                ),
                events: [
                  FlutterWeekViewEvent(
                    title: 'An event 1',
                    description: 'A description 1',
                    start: date.add(Duration(hours: 3)),
                    end: date.add(Duration(hours: 5, minutes: 30)),
                    backgroundColor: Colors.amberAccent,
                  ),
                  FlutterWeekViewEvent(
                    title: 'An event 2',
                    description: 'A description 2',
                    start: date.add(Duration(hours: 19)),
                    end: date.add(Duration(hours: 22)),

                  ),
                  FlutterWeekViewEvent(
                    title: 'An event 3',
                    description: 'A description 3',
                    start: date.add(Duration(hours: 23, minutes: 30)),
                    end: date.add(Duration(hours: 25, minutes: 30)),
                  ),
                  FlutterWeekViewEvent(
                    title: 'An event 4',
                    description: 'A description 4',
                    start: date.add(Duration(hours: 20)),
                    end: date.add(Duration(hours: 21)),
                  ),
                  FlutterWeekViewEvent(
                    title: 'An event 5',
                    description: 'A description 5',
                    start: date.add(Duration(hours: 20)),
                    end: date.add(Duration(hours: 21)),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
