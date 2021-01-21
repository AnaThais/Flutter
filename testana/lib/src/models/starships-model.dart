class StarshipsModel {
  String name;
  String model;
  String starshipClass;
  String manufacturer;
  String costInCredits;
  String length;
  String crew;
  String passengers;
  String maxAtmospheringSpeed;
  String hyperdriveRating;
  String mglt;
  String cargoCapacity;
  String consumables;
  String url;
  String created;
  String edited;

  List films;
  List pilots;

  StarshipsModel(
      {this.name,
      this.model,
      this.starshipClass,
      this.manufacturer,
      this.costInCredits,
      this.length,
      this.crew,
      this.passengers,
      this.maxAtmospheringSpeed,
      this.hyperdriveRating,
      this.mglt,
      this.cargoCapacity,
      this.consumables,
      this.films,
      this.pilots,
      this.url,
      this.created,
      this.edited});

  static StarshipsModel fromMap(dynamic map) {
    if (map == null) return null;

    return StarshipsModel(
      name: map['name'],
      model: map['model'],
      starshipClass: map['starship_class'],
      manufacturer: map['manufacturer'],
      costInCredits: map['cost_in_credits'],
      length: map['length'],
      crew: map['crew'],
      passengers: map['passengers'],
      maxAtmospheringSpeed: map['max_atmosphering_speed'],
      hyperdriveRating: map['hyperdrive_rating'],
      mglt: map['MGLT'],
      cargoCapacity: map['cargo_capacity'],
      consumables: map['consumables'],
      url: map['url'],
      created: map['created'],
      edited: map['edited'],
      films: map['films'],
      pilots: map['pilots'],
    );
  }
}
