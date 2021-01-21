class SpeciesModel {
  String name;

  SpeciesModel({this.name});

  static SpeciesModel fromMap(dynamic map) {
    if (map == null) return null;

    return SpeciesModel(name: map['name']);
  }
}
