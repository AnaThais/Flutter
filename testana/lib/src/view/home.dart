import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'character-list.dart';
import 'starships-list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;

  void incrementCounter() {
    cont = cont++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(children: <Widget>[
        new RaisedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StarshipsList()),
            ),
          },
          child: new Text('Starships'),
          textColor: Colors.black,
          padding: new EdgeInsets.all(30),
          color: Colors.purple[200],
        ),
        new RaisedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CharactersList()),
            ),
          },
          child: new Text('Characters'),
          textColor: Colors.black,
          padding: new EdgeInsets.all(30),
          color: Colors.purple[100],
        ),
      ]),
    );
  }
}
