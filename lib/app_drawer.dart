import 'package:efficom_app/api_call.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'compteur.dart';
import 'database_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('stefanspeter26@gmail.com'),
            accountName: Text('Stefan Speter'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars3.githubusercontent.com/u/32258096?s=460&u=af555943b9efdd29e6e74f6aab41d3fa31cbebc4&v=4"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('My articles'),
            trailing: Chip(
              label: Text("11"),
              labelStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              backgroundColor: Colors.blue[100],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About me'),
          ),

          ListTile(
            leading: Icon(Icons.panorama),
            title: Text('Gallery'),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Compteur'),
            onTap: () {
              Navigator.push(context, Compteur.route());
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('API'),
            onTap: () {
              Navigator.push(context, ApiCall.route());
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.database),
            title: Text('Database'),
            onTap: () {
              Navigator.push(context, Database.route());
            },
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.help_outline),
                title: Text('About my app'),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );

  }
}
