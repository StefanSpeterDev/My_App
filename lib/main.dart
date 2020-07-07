import 'package:efficom_app/edit_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'app_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
        routes: {
          InputForm.routeName: (context) => InputForm(),
        });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: new AppBar(
        title: Text('Mon CV'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            InputImage(),
            InputPrenom(),
            InputMetier(),
            InputDescription(),
            InputExperience(),
          ],
        ),
      ),
      floatingActionButton: ContactButton(),
    );
  }
}

class InputImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.network(
              'https://media-exp1.licdn.com/dms/image/C4E03AQFEzomviX033Q/profile-displayphoto-shrink_200_200/0?e=1599696000&v=beta&t=mp1wKDTWVribyk8dOcmJJlJGr03pzjoRZVBNhAPyDXg',
              height: 200,
            )),
      ],
    );
  }
}

class InputPrenom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Center(
        child: Text(
          'Stefan Speter',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
    );
  }
}

class InputMetier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Center(
        child: Text(
          'Web developer',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
        ),
      ),
    );
  }
}

class InputDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: AutoSizeText(
        'I love to create websites, applications and be involved in any type of projects. I create everytime, at work, at school or for my own pleasure!',
        style: TextStyle(fontSize: 16, color: Colors.grey),
        maxLines: 4,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class InputExperience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      /*1*/
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*2*/
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text(
              'Experience',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontSize: 28),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text(
              'Web Developer',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text(
              'HB-Digit',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text(
              'Lille, France',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                  fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Row(
              children: <Widget>[
                Text(
                  'August 2019 - Present ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 18),
                ),
                Text(
                  '(1year)',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 0),
            child: AutoSizeText(
              "I've been creating different websites using Drupal 8 and started to learn Flutter.",
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.edit),
      onPressed: () {
        Navigator.pushNamed(context, InputForm.routeName,
            arguments: ScreenArguments('Stefan', 'Speter'));
      },
    );
  }
}

class ScreenArguments {
  final String firstName;
  final String lastName;

  ScreenArguments(this.firstName, this.lastName);
}
