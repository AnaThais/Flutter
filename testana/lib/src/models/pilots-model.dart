class PilotsModel {
  String name;

  PilotsModel({this.name});

  static PilotsModel fromMap(dynamic map) {
    if (map == null) return null;

    return PilotsModel(name: map['name']);
  }
}
