import 'package:flutter/material.dart';

import 'main.dart';

class EditInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compteur'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          InputForm()

        ],
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  static const routeName = '/inputForm';


  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Column(
      children: <Widget>[
        Text('First name:'),
        TextFormField(
          initialValue: args.firstName,
        ),
        Text('Last name:'),
        TextFormField(
          initialValue: args.lastName,
        )

      ],
    );
  }
}
