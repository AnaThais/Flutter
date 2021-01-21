import 'package:dio/dio.dart';
import 'package:testana/src/models/characters-model.dart';
import 'package:testana/src/models/species-model.dart';

class CharactersRepository {
  Dio _dio = Dio();

  Future<List<CharactersModel>> findAll() async {
    Response response = await _dio.get('https://swapi.dev/api/people/');
    List<CharactersModel> list = [];
    for (var item in (response.data['results'] as List)) {
      CharactersModel model = CharactersModel.fromMap(item);
      list.add(model);
    }

    return list;
  }

  Future<List<SpeciesModel>> findSpecies(List<dynamic> species) async {
    List<SpeciesModel> list = [];

    if (species == null || species.isEmpty) {
      return list;
    }

    for (var item in species) {
      String url = item.toString().replaceRange(0, 4, 'https');

      Response response = await _dio.get(url);
      SpeciesModel model = SpeciesModel.fromMap(response.data);
      list.add(model);
    }
    return list;
  }
}
