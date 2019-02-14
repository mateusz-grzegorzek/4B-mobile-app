import 'package:flutter/material.dart';
import '../print.dart';

StatefulWidget fBuildWillPopScope(Widget page) {
  return WillPopScope(
    onWillPop: () async {
      return true;
    },
    child: page
  );
}

class MenuItem extends StatelessWidget {
  final String mId;
  final String mTitle;

  MenuItem(this.mId, this.mTitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[fBuildListTile(context), fBuildDivider()],
    );
  }

  Padding fBuildDivider() {
    return Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: const Divider(height: 2.1, color: Colors.white));
  }

  Widget fBuildListTile(context) {
    return ListTile(
        title: fPrintText(mTitle, gMenuItemTextStyle),
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushNamed(mId);
        });
  }
}

class MenuBar extends StatelessWidget {
  final List<MenuItem> mMenuItems;
  MenuBar(this.mMenuItems);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    items.add(fBuildDrawerHeader(context));
    items.addAll(mMenuItems);

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Color(0xFF231f20)),
      child: Drawer(
        child: ListView(
            children: items),
      ),
    );
  }

  Widget fBuildDrawerHeader(context) {
    return Container(
        height: 60.0,
        child: DrawerHeader(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Image(
                    image: AssetImage("assets/images/cancel_sign.png"),
                    width: 25.0,
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ],
            )));
  }
}
