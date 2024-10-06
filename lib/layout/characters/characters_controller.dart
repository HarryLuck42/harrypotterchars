import 'package:get/get.dart';
import 'package:my_products/core/base/base_controller.dart';
import 'package:my_products/core/constraint/const.dart';
import 'package:my_products/core/constraint/enum.dart';
import 'package:my_products/model/local/character_data.dart';
import 'package:my_products/model/response/character_response.dart';

import '../../service/api_handling.dart';

class CharactersController extends BaseController {
  final isLoading = false.obs;

  final characters = <CharacterData>[].obs;

  final currPage = PageType.all.obs;

  void setCurrentPage(PageType page){
    currPage(page);
  }

  final house = HouseType.gryffindor.obs;
  void setHouse(HouseType value){
    house(value);
  }


  @override
  Future onInit() async {
    super.onInit();
    getCharacters();
  }

  Future getCharacters() async {
    isLoading(true);
    try {
      await ApiHandling.hitApi<List<Character>>(
          currPage.value == PageType.all
              ? apiRep.apiService.getListCharacters()
              : currPage.value == PageType.students
                  ? apiRep.apiService.getStudents()
                  : currPage.value == PageType.staff
                      ? apiRep.apiService.getStaff()
                      : apiRep.apiService
                          .getCharactersByHouse(houseMap[house.value] ?? ""),
          (response) {
        characters(response.map((e) => e.convert()).toList());
        isLoading(false);
      }, (failed) {
        characters(getCharactersFromMemory(currPage.value));
        isLoading(false);
      });
    } catch (e) {
      characters(getCharactersFromMemory(currPage.value));
      isLoading(false);
    }
  }

  List<CharacterData> getCharactersFromMemory(PageType type,
      {HouseType house = HouseType.none}) {
    switch (type) {
      case PageType.all:
        return memoryAction.getCharacters();
      case PageType.students:
        return memoryAction.getStudents();
      case PageType.staff:
        return memoryAction.getStaff();
      case PageType.byHouse:
        return house == HouseType.none
            ? []
            : memoryAction.getCharactersByHouse(house);
    }
  }

  Future searchCharacters(String keyword) async {
    characters.clear();
    characters(memoryAction.searchCharacters(keyword, currPage.value, house.value));
  }
}
