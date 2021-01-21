import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testana/src/models/characters-model.dart';
import 'package:testana/src/repositories/characters-repository.dart';

import 'character-datails.dart';

class CharactersList extends StatefulWidget {
  @override
  _CharactersListState createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  Future<List<CharactersModel>> charactersFuture;

  CharactersRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = CharactersRepository();
    charactersFuture = _repository.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
      ),
      body: FutureBuilder(
          future: this.charactersFuture,
          builder: (BuildContext context,
              AsyncSnapshot<List<CharactersModel>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: <Widget>[Icon(Icons.error_outline)],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  var item = snapshot.data[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.birthYear),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            size: 20.0,
                            color: Colors.black,
                          ),
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CharactersDetails(item)),
                            ),
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
