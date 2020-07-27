import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

List monthNames = ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
String monthTitle = monthNames[DateTime.now().month-1];

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      color: Colors.white,
      // margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel(
        weekendTextStyle: TextStyle(color: Colors.grey),
        daysTextStyle: TextStyle(color: Colors.black),
        weekdayTextStyle: TextStyle(color: Colors.black),
        weekDayFormat: WeekdayFormat.standaloneNarrow,
        todayButtonColor: Colors.black,
        showHeaderButton: false,
        // leftButtonIcon: Icon(Icons.chevron_left),
        // rightButtonIcon: Icon(Icons.chevron_right),
        headerMargin: EdgeInsets.only(bottom: 25),
        headerTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25),
        headerText: monthTitle,
        onCalendarChanged: (DateTime dateTime){
          setState(() {
            monthTitle = monthNames[dateTime.month-1];
            print(monthNames[dateTime.month-1]);
          });
        },
      ),
    );
  }
}
