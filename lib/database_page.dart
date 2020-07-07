import 'package:efficom_app/db/userDatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';

class Database extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => Database());
  }

  @override
  _DatabaseState createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API User'),
      ),
      body: Container(
        child: FutureBuilder(
          future: UserDatabaseHelper.instance.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {

              final user = snapshot.data;
              print(snapshot);
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(user[index]['firstname']),
                    subtitle: Text(user[index]['lastname']),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}


