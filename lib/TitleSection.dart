import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget with PreferredSizeWidget {
  final List<String> menuChoices = ['one', 'two', 'three', 'four'];
  final String date;
  // List menucontent

  TopHeader(this.date);

  //Typography.blackCupertino

  @override
  Widget build(BuildContext context) {
    const TextTheme _textTheme = TextTheme(
      title: TextStyle(color: Colors.black, fontSize: 30),
    );

    return AppBar(
      title: Padding(child: Text(date), padding: EdgeInsets.only(left: 7),),
      backgroundColor: Colors.white,
      elevation: 0.0,
      textTheme: _textTheme,
      centerTitle: false,
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(Icons.menu, color: Colors.black),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return menuChoices.map((String choice) {
                return PopupMenuItem(child: Text(choice));
              }).toList();
            })
      ],
    );
  }

  void choiceAction(dynamic ina) {
    print('Selected?');
    print(ina);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
