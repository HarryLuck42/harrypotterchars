import 'package:my_products/core/constraint/enum.dart';
import 'package:my_products/core/memory/hive/box_keys.dart';
import 'package:my_products/model/local/character_data.dart';

import '../constraint/const.dart';
import 'hive/boxes.dart';

class MemoryAction {
  final IMemoryAction memoryAction;

  MemoryAction(this.memoryAction);

  List<CharacterData> getCharacters() {
    return memoryAction.getCharacters();
  }

  CharacterData? getCharacterById(String id) {
    return memoryAction.getCharacterById(id);
  }

  List<CharacterData> getStudents() {
    return memoryAction.getStudents();
  }

  List<CharacterData> getStaff() {
    return memoryAction.getStaff();
  }

  List<CharacterData> getCharactersByHouse(HouseType type) {
    return memoryAction.getCharactersByHouse(type);
  }

  List<CharacterData> searchCharacters(
      String keyword, PageType type, HouseType house) {
    return memoryAction.searchCharacters(keyword, type, house);
  }

  Future saveCharacters(List<CharacterData> characters) async {
    await memoryAction.saveCharacters(characters);
  }
}

abstract class IMemoryAction {
  List<CharacterData> getCharacters();

  CharacterData? getCharacterById(String id);

  List<CharacterData> getStudents();

  List<CharacterData> getStaff();

  List<CharacterData> getCharactersByHouse(HouseType type);

  searchCharacters(String keyword, PageType type, HouseType house);

  Future saveCharacters(List<CharacterData> characters);
}

class HiveMemoryAction implements IMemoryAction {
  @override
  List<CharacterData> getCharacters() {
    return Boxes.getBox<CharacterData>(BoxKeys.character).values.toList();
  }

  @override
  CharacterData? getCharacterById(String id) {
    return Boxes.getBox<CharacterData>(BoxKeys.character)
        .values
        .where((e) => e.id == id)
        .firstOrNull;
  }

  @override
  List<CharacterData> getStudents() {
    return Boxes.getBox<CharacterData>(BoxKeys.character)
        .values
        .where((e) => e.hogwartsStudent == true)
        .toList();
  }

  @override
  List<CharacterData> getStaff() {
    return Boxes.getBox<CharacterData>(BoxKeys.character)
        .values
        .where((e) => e.hogwartsStaff == true)
        .toList();
  }

  @override
  List<CharacterData> getCharactersByHouse(HouseType type) {
    final house = houseMap[type];
    return Boxes.getBox<CharacterData>(BoxKeys.character)
        .values
        .where((e) => e.house == house)
        .toList();
  }

  @override
  List<CharacterData> searchCharacters(
      String keyword, PageType type, HouseType house) {
    switch (type) {
      case PageType.all:
        return Boxes.getBox<CharacterData>(BoxKeys.character)
            .values
            .where((e) =>
                e.name?.toLowerCase().contains(keyword.toLowerCase()) ?? false)
            .toList();
      case PageType.students:
        return Boxes.getBox<CharacterData>(BoxKeys.character)
            .values
            .where((e) =>
                (e.name?.toLowerCase().contains(keyword.toLowerCase()) ??
                    false) &&
                e.hogwartsStudent == true)
            .toList();
      case PageType.staff:
        return Boxes.getBox<CharacterData>(BoxKeys.character)
            .values
            .where((e) =>
                (e.name?.toLowerCase().contains(keyword.toLowerCase()) ??
                    false) &&
                e.hogwartsStaff == true)
            .toList();
      case PageType.byHouse:
        return Boxes.getBox<CharacterData>(BoxKeys.character)
            .values
            .where((e) =>
                (e.name?.toLowerCase().contains(keyword.toLowerCase()) ??
                    false) &&
                e.house == houseMap[house])
            .toList();
    }
  }

  @override
  Future saveCharacters(List<CharacterData> characters) async {
    await Boxes.getBox<CharacterData>(BoxKeys.character).clear();
    await Boxes.getBox<CharacterData>(BoxKeys.character).addAll(characters);
  }
}
