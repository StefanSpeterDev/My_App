import 'package:flutter/material.dart';

class Compteur extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => Compteur());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compteur'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
            CompteurAddition(),

        ],
      ),
    );
  }
}

class CompteurAddition extends StatefulWidget {
  @override
  _CompteurAdditionState createState() => _CompteurAdditionState();
}

class _CompteurAdditionState extends State<CompteurAddition> {

  final textfield1 = TextEditingController();
  final textfield2 = TextEditingController();

  @override
  void dispose() {
    textfield1.dispose();
    textfield2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('First Number:'),
        TextField(
          controller: textfield1,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your first number'
          ),
        ),
        Text('Second Number:'),
        TextField(
          controller: textfield1,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your first number'
          ),
        )

      ],
    );
  }
}
