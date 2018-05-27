import 'package:flutter/material.dart';
import 'package:astrid/astrid.dart' as Balance;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          Balance()
        ],
      ),
    );
  }
}
