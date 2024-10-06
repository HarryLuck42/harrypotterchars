import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_products/core/base/base_state.dart';
import 'package:my_products/layout/character_detail/character_detail_controller.dart';
import 'package:my_products/model/local/character_data.dart';
import 'package:my_products/widgets/custom_app_bar.dart';

import '../../initial/locale/localizations.dart';
import '../state_widgets/loading_list.dart';
import 'components/first_body_detail.dart';
import 'components/header_detail.dart';
import 'components/second_body_detail.dart';

class CharacterDetailScreen extends StatefulWidget {
  final CharacterData character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreen();
}

class _CharacterDetailScreen extends State<CharacterDetailScreen> with BaseState {

  final ref = Get.put(CharacterDetailController());

  @override
  void afterFirstLayout(BuildContext context) {
    ref.getCharacterDetail(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, lang(context).characterDetail ?? "Character Detail"),
      body: Obx((){
        return ref.isLoading.value
            ? const LoadingList()
            : RefreshIndicator(
          onRefresh: () async {
            ref.getCharacterDetail(widget.character);
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderDetail(ref: ref),
                        FirstBodyDetail(ref: ref),
                        SecondBodyDetail(ref: ref)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}





