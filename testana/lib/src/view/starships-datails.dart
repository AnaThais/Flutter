import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testana/src/models/pilots-model.dart';
import 'package:testana/src/models/starships-model.dart';
import 'package:testana/src/repositories/starships-reposioty.dart';

// ignore: must_be_immutable
class StarshipsDetails extends StatelessWidget {
  StarshipsModel starshipsModel;

  StarshipsDetails(this.starshipsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Starships Details")),
        body: starshipsCharacters(),
      ),
    );
  }

  starshipsCharacters() {
    StarshipsRepository repository = StarshipsRepository();
    Future<List<PilotsModel>> speciesFuture =
        repository.findSpecies(starshipsModel.pilots);

    return Container(
        padding: EdgeInsets.all(32.0),
        child: Scaffold(
          body: FutureBuilder(
              future: speciesFuture,
              builder: (BuildContext context,
                  AsyncSnapshot<List<PilotsModel>> snapshot) {
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
