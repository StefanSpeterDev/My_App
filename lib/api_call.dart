import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'models/user.dart';

class ApiCall extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => ApiCall());
  }

  @override
  _ApiCallState createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {

  Future<List<User>> _getUsers() async {
    print('avant');
    var response = await http.get('http://demo6248547.mockable.io/getpersons');
    print(response.statusCode);
    print("test");

    if (response.statusCode == 200) {
      // on la récupère sous form de JSON
      List jsonData = jsonDecode(response.body);

      jsonData =
      jsonData.map((person) => new User.fromJson(person)).toList();

      print("User.length ${jsonData.length}");

      return jsonData;
    } else {
      print('Erreur API status code: ${response.statusCode}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API User'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].firstName),
                    subtitle: Text(snapshot.data[index].age.toString()),
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


