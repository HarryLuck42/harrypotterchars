import 'package:my_products/core/constraint/asset_path.dart';
import 'package:my_products/core/constraint/enum.dart';

const baseUrl = "https://hp-api.onrender.com/api/";
const language = "en-US";


const houseMap = <HouseType, String>{
  HouseType.gryffindor : "Gryffindor",
  HouseType.slytherin: "Slytherin",
  HouseType.hufflepuff: "Hufflepuff",
  HouseType.ravenclaw: "Ravenclaw",
  HouseType.none: ""
};

const houseIcon = <String, String>{
  "Gryffindor" : "${AssetPath.image}gryffindor.webp",
  "Slytherin": "${AssetPath.image}slytherin.webp",
  "Hufflepuff": "${AssetPath.image}hufflepuff.webp",
  "Ravenclaw": "${AssetPath.image}ravenclaw.webp",
  "": "${AssetPath.image}hogwarts.webp"
};


