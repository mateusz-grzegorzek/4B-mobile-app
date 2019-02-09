import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String mId;
  final String mTitle;

  MenuItem(this.mId, this.mTitle);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(mTitle,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed(mId);
          }),
    );
  }
}

class MenuBar extends StatelessWidget {
  final List<MenuItem> mMenuItems;
  MenuBar(this.mMenuItems);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(15.0, 50.0, 50.0, 0.0),
        children: mMenuItems,
      ),
    );
  }
}
