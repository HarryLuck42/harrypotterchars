import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_products/core/constraint/asset_path.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/core/routing/routes.dart';
import 'package:my_products/layout/characters/characters_controller.dart';
import 'package:my_products/layout/dialog/search_dialog.dart';
import 'package:my_products/layout/state_widgets/empty_state.dart';
import 'package:my_products/layout/state_widgets/loading_list.dart';
import 'package:my_products/widgets/custom_app_bar.dart';
import 'package:my_products/widgets/custom_icon_button.dart';

import '../../core/constraint/const.dart';
import 'adapter/character_adapter.dart';
import 'components/character_drawer.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final ref = Get.put(CharactersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(preferredSize: const Size(double.infinity, 60), child: Obx((){
        return CustomAppBar(
            context,
            context.getTitleBar(ref.currPage.value, ref.house.value) ??
                (houseMap[ref.house.value] ?? "Harry Potter"),
            isBack: false, onOpenDrawer: () {
          scaffoldKey.currentState?.openDrawer();
        }, actions: [
          CustomIconButton(
              iconData: "${AssetPath.vector}search.svg",
              height: 30,
              width: 30,
              defaultColor: false,
              color: context.getColorScheme().primary,
              onPressed: () async {
                String? keyword = await showDialog(
                    context: context,
                    builder: (context) {
                      return const SearchDialog();
                    });
                if (keyword != null) {
                  if (keyword.isNotEmpty) {
                    ref.searchCharacters(keyword);
                  }
                }
              }),
          CustomIconButton(
              iconData: "${AssetPath.vector}settings.svg",
              height: 30,
              width: 30,
              defaultColor: false,
              color: context.getColorScheme().primary,
              onPressed: () async {
                ref.routing.move(Routes.settings);
              }),
        ]);
      })),
      drawer: CharacterDrawer(
        ref: ref,
      ),
      body: Obx(() => ref.isLoading.value
          ? const LoadingList()
          : RefreshIndicator(
              onRefresh: () async {
                ref.getCharacters();
              },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  ref.characters.isEmpty ? const SliverToBoxAdapter(child: EmptyState(),) : SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: ((context.getWidth() / 2) - 8) /
                            (context.getHeight() * 0.455)),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return CharacterAdapter(
                          character: ref.characters[index],
                          position: index,
                          ref: ref,
                        );
                      },
                      childCount: ref.characters.length,
                    ),
                  ),
                ],
              ),
            ),),
    );
  }

  @override
  void dispose() {
    ref.dispose();
    super.dispose();
  }
}
