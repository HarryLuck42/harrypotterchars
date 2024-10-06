class Languages{
  String? appTitle;
  String? loading;
  String? noInternet;
  String? settings;
  String? dark;
  String? light;
  String? language;
  String? noDataFound;
  String? search;
  String? allCharacters;
  String? students;
  String? staff;
  String? house;
  String? characterDetail;
  String? species;
  String? gender;
  String? ancestry;
  String? eyesColour;
  String? hairColour;
  String? actor;
  String? alternateNames;
  String? alternateActors;
  String? wand;
  String? wood;
  String? core;
  String? length;

  Languages.fromJson(Map<String, String> json){
    appTitle = json['app_title'];
    loading = json['loading'];
    noInternet = json['no_internet'];
    settings = json['settings'];
    dark = json['dark'];
    light = json['light'];
    language = json['language'];
    noDataFound = json['no_data_found'];
    search = json['search'];
    allCharacters = json['all_characters'];
    students = json['students'];
    staff = json['staff'];
    house = json['house'];
    characterDetail = json['character_detail'];
    species = json['species'];
    gender = json['gender'];
    ancestry = json['ancestry'];
    eyesColour = json['eyes_colour'];
    hairColour = json['hair_colour'];
    actor = json['actor'];
    alternateNames = json['alternate_names'];
    alternateActors = json['alternate_actors'];
    wand = json['wand'];
    wood = json['wood'];
    core = json['core'];
    length = json['length'];
  }
}