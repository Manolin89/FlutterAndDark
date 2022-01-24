import 'package:flutter/material.dart';
import '../screns/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  //const MainDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListTitle(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(
          Icons.restaurant,
          size: 26,
        ),
        title: Text(
          'Meals',
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        onTap: () {},
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTitle('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTitle('Filter', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
