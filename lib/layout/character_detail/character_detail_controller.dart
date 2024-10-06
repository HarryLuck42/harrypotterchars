import 'package:get/get.dart';
import 'package:my_products/core/base/base_controller.dart';
import 'package:my_products/model/local/character_data.dart';
import 'package:my_products/model/response/character_response.dart';

import '../../service/api_handling.dart';

class CharacterDetailController extends BaseController {
  final isLoading = false.obs;

  Rx<CharacterData?> detail = CharacterData().obs;

  Future getCharacterDetail(CharacterData character) async {
    isLoading(true);
    try {
      if (character.id == null) {
        await ApiHandling.hitApi<Character>(
            apiRep.apiService.getCharacterDetail(character.id!), (response) {
          detail(response.convert());
          isLoading(true);
        }, (failed) {
          detail.value = memoryAction.getCharacterById(character.id!);
          isLoading(false);
        });
      } else {
        detail.value = null;
        isLoading(false);
      }
    } catch (e) {
      detail.value = memoryAction.getCharacterById(character.id ?? "1");
      isLoading(false);
    }
  }
}
