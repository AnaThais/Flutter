import 'package:flutter/material.dart';
import 'package:testana/src/models/starships-model.dart';
import 'package:testana/src/repositories/starships-reposioty.dart';

import 'starships-datails.dart';

class StarshipsList extends StatefulWidget {
  @override
  _StarshipsListState createState() => _StarshipsListState();
}

class _StarshipsListState extends State<StarshipsList> {
  Future<List<StarshipsModel>> starshipsFuture;
  StarshipsRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = StarshipsRepository();
    starshipsFuture = _repository.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starships'),
      ),
      body: FutureBuilder(
          future: this.starshipsFuture,
          builder: (BuildContext context,
              AsyncSnapshot<List<StarshipsModel>> snapshot) {
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
                    subtitle: Text(item.model),
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
                                  builder: (context) => StarshipsDetails(item)),
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
