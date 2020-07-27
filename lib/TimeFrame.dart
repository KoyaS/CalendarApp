import 'package:CalendarApp/CalendarView.dart';
import 'package:CalendarApp/DateView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

class TimeFrame extends StatefulWidget {
  @override
  _TimeFrameState createState() => _TimeFrameState();
  
}

int paneNumber = 0;

class _TimeFrameState extends State<TimeFrame> {
  @override
  Widget build(BuildContext context) {
    double borderRadius = 10;

    return Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
        height: 400,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: (paneNumber==0) ? CalendarView() : DateView(),
                    // child: CalendarView(),
                    ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.calendar_today), 
                          color: (paneNumber==0) ? Colors.black : Colors.grey,
                          onPressed: () {setState(() {
                            paneNumber = 0;
                          });}
                          ),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.calendar_view_day), 
                          color: (paneNumber==1) ? Colors.black : Colors.grey,
                          onPressed: () {setState(() {
                            paneNumber = 1;
                          });}),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius)),
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
