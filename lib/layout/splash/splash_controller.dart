import 'package:get/get.dart';
import 'package:my_products/core/base/base_controller.dart';

import '../../core/routing/routes.dart';
import '../../model/response/character_response.dart';
import '../../service/api_handling.dart';

class SplashController extends BaseController{

  @override
  Future onInit() async {
    super.onInit();
    getCharacters();
  }

  Future getCharacters() async {
    try {
      await ApiHandling.hitApi<List<Character>>(
          apiRep.apiService.getListCharacters(),
              (response) async {
            await memoryAction.saveCharacters(response.map((e) => e.convert()).toList());
            Future.delayed(const Duration(seconds: 1), (){
              routing.moveReplacement(Routes.characters);

            });
          }, (failed) {
        routing.showSnackBar(snackBar: const GetSnackBar(title: "Please check your connection",));
      });
    } catch (e) {
      routing.showSnackBar(snackBar: const GetSnackBar(title: "Please check your connection",));
    }
  }
}