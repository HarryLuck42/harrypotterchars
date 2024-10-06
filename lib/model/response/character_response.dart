import 'package:json_annotation/json_annotation.dart';
import 'package:my_products/model/local/character_data.dart';
import 'package:my_products/model/local/wand_data.dart';

part 'character_response.g.dart';

@JsonSerializable()
class Character {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "alternate_names")
  List<String>? alternateNames;

  @JsonKey(name: "species")
  String? species;

  @JsonKey(name: "gender")
  String? gender;

  @JsonKey(name: "house")
  String? house;

  @JsonKey(name: "dateOfBirth")
  String? dateOfBirth;

  @JsonKey(name: "yearOfBirth")
  int? yearOfBirth;

  @JsonKey(name: "wizard")
  bool? wizard;

  @JsonKey(name: "ancestry")
  String? ancestry;

  @JsonKey(name: "eyeColour")
  String? eyeColour;

  @JsonKey(name: "hairColour")
  String? hairColour;

  @JsonKey(name: "wand")
  Wand? wand;

  @JsonKey(name: "patronus")
  String? patronus;

  @JsonKey(name: "hogwartsStudent")
  bool? hogwartsStudent;

  @JsonKey(name: "hogwartsStaff")
  bool? hogwartsStaff;

  @JsonKey(name: "actor")
  String? actor;

  @JsonKey(name: "alternate_actors")
  List<String>? alternateActors;

  @JsonKey(name: "alive")
  bool? alive;

  @JsonKey(name: "image")
  String? image;

  Character({
    this.id,
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alternateActors,
    this.alive,
    this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  CharacterData convert() {
    return CharacterData(
        id: id,
        name: name,
        alternateNames: alternateNames,
        species: species,
        gender: gender,
        house: house,
        dateOfBirth: dateOfBirth,
        yearOfBirth: yearOfBirth,
        wizard: wizard,
        ancestry: ancestry,
        eyeColour: eyeColour,
        hairColour: hairColour,
        wand: wand?.convert(),
        patronus: patronus,
        hogwartsStudent: hogwartsStudent,
        hogwartsStaff: hogwartsStaff,
        actor: actor,
        alternateActors: alternateActors,
        alive: alive,
        image: image);
  }
}

@JsonSerializable()
class Wand {
  @JsonKey(name: "wood")
  String? wood;
  @JsonKey(name: "core")
  String? core;
  @JsonKey(name: "length")
  int? length;

  Wand({
    this.wood,
    this.core,
    this.length,
  });

  factory Wand.fromJson(Map<String, dynamic> json) => _$WandFromJson(json);

  Map<String, dynamic> toJson() => _$WandToJson(this);

  WandData convert() {
    return WandData(wood: wood, core: core, length: length);
  }
}
