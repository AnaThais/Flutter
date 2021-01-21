import 'package:dio/dio.dart';
import 'package:testana/src/models/pilots-model.dart';
import 'package:testana/src/models/starships-model.dart';

class StarshipsRepository {
  Dio _dio = Dio();

  Future<List<StarshipsModel>> findAll() async {
    Response response = await _dio.get('https://swapi.dev/api/starships/');
    List<StarshipsModel> list = [];
    for (var item in (response.data['results'] as List)) {
      StarshipsModel model = StarshipsModel.fromMap(item);
      list.add(model);
    }
    return list;
  }

  Future<List<PilotsModel>> findSpecies(List<dynamic> species) async {
    List<PilotsModel> list = [];

    if (species == null || species.isEmpty) {
      return list;
    }

    for (var item in species) {
      String url = item.toString().replaceRange(0, 4, 'https');

      Response response = await _dio.get(url);
      PilotsModel model = PilotsModel.fromMap(response.data);
      list.add(model);
    }
    return list;
  }
}
