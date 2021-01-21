class CharactersModel {
  String name;
  String birthYear;
  String eyeColor;
  String gender;
  String hairColor;
  String height;
  String mass;
  String skinColor;
  String homeworld;
  String url;
  String created;
  String edited;

  List films;
  List species;
  List starships;
  List vehicles;

  CharactersModel(
      {this.name,
      this.birthYear,
      this.eyeColor,
      this.gender,
      this.hairColor,
      this.height,
      this.mass,
      this.skinColor,
      this.homeworld,
      this.films,
      this.species,
      this.starships,
      this.vehicles,
      this.url,
      this.created,
      this.edited});

  static CharactersModel fromMap(dynamic map) {
    if (map == null) return null;

    return CharactersModel(
      name: map['name'],
      birthYear: map['birth_year'],
      eyeColor: map['eye_color'],
      gender: map['gender'],
      hairColor: map['hair_color'],
      height: map['height'],
      mass: map['mass'],
      skinColor: map['skin_color'],
      homeworld: map['homeworld'],
      url: map['url'],
      created: map['created'],
      edited: map['edited'],
      films: map['films'],
      species: map['species'],
      starships: map['starships'],
      vehicles: map['vehicles'],
    );
  }
}
