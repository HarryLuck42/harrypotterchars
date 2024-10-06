
import 'package:hive/hive.dart';
import 'package:my_products/model/local/wand_data.dart';

part 'character_data.g.dart';

@HiveType(typeId: 0)
class CharacterData extends HiveObject{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  List<String>? alternateNames;

  @HiveField(3)
  String? species;

  @HiveField(4)
  String? gender;

  @HiveField(5)
  String? house;

  @HiveField(6)
  String? dateOfBirth;

  @HiveField(7)
  int? yearOfBirth;

  @HiveField(8)
  bool? wizard;

  @HiveField(9)
  String? ancestry;

  @HiveField(10)
  String? eyeColour;

  @HiveField(11)
  String? hairColour;

  @HiveField(12)
  WandData? wand;

  @HiveField(13)
  String? patronus;

  @HiveField(14)
  bool? hogwartsStudent;

  @HiveField(15)
  bool? hogwartsStaff;

  @HiveField(16)
  String? actor;

  @HiveField(17)
  List<String>? alternateActors;

  @HiveField(18)
  bool? alive;

  @HiveField(19)
  String? image;

  CharacterData({this.id,
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
    this.image,});

  CharacterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternateNames = json['alternate_names'] != null ? json['alternate_names'].cast<String>() : [];
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'];
    yearOfBirth = json['yearOfBirth'];
    wizard = json['wizard'];
    ancestry = json['ancestry'];
    eyeColour = json['eyeColour'];
    hairColour = json['hairColour'];
    wand = json['wand'] != null ? WandData.fromJson(json['wand']) : null;
    patronus = json['patronus'];
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor'];
    alternateActors = json['alternate_actors'] != null ? json['alternate_actors'].cast<String>() : [];
    alive = json['alive'];
    image = json['image'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['alternate_names'] = alternateNames;
    map['species'] = species;
    map['gender'] = gender;
    map['house'] = house;
    map['dateOfBirth'] = dateOfBirth;
    map['yearOfBirth'] = yearOfBirth;
    map['wizard'] = wizard;
    map['ancestry'] = ancestry;
    map['eyeColour'] = eyeColour;
    map['hairColour'] = hairColour;
    if (wand != null) {
      map['wand'] = wand?.toJson();
    }
    map['patronus'] = patronus;
    map['hogwartsStudent'] = hogwartsStudent;
    map['hogwartsStaff'] = hogwartsStaff;
    map['actor'] = actor;
    map['alternate_actors'] = alternateActors;
    map['alive'] = alive;
    map['image'] = image;
    return map;
  }
}