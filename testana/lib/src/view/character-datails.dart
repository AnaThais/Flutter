import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testana/src/models/characters-model.dart';
import 'package:testana/src/models/species-model.dart';
import 'package:testana/src/repositories/characters-repository.dart';

// ignore: must_be_immutable
class CharactersDetails extends StatelessWidget {
  CharactersModel charactersModel;
  CharactersDetails(this.charactersModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Characters Details")),
      body: detailsCharacters(),
    );
  }

  detailsCharacters() {
    CharactersRepository repository = CharactersRepository();
    Future<List<SpeciesModel>> speciesFuture =
        repository.findSpecies(charactersModel.species);

    return Container(
        padding: EdgeInsets.all(32.0),
        child: Scaffold(
          body: FutureBuilder(
              future: speciesFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<List<SpeciesModel>> snapshot) {
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
                      );
                    },
                  );
                }
              }),
        ));
  }
}
