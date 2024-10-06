import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/dialog/houses_dialog.dart';
import 'package:my_products/widgets/custom_icon.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/enum.dart';
import '../../../initial/locale/localizations.dart';
import '../../../widgets/custom_gesture.dart';
import '../../../widgets/custom_text.dart';
import '../characters_controller.dart';

class CharacterDrawer extends StatelessWidget {
  final CharactersController ref;

  const CharacterDrawer({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildHeader(context), buildMenuItems(context, ref)],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
  padding: const EdgeInsets.only(left: 10, bottom: 6),
  height: context.getHeight() * 0.2,
  decoration: const BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xffc72929),
      Color(0xffef9759),
      Color(0xff4A0069),
    ], begin: Alignment.bottomRight, end: Alignment.topLeft),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset("${AssetPath.image}harry_potter.webp", width: 50, height: 50, fit: BoxFit.fitWidth,),
      Container(
        margin: const EdgeInsets.only(left: 10),
        child: CustomText(
          textToDisplay: lang(context).appTitle ?? "Harry Potter Characters",
          textStyle: context.getTextTheme().titleSmall?.copyWith(color: Colors.white.withOpacity(0.7)),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 10),
        child: CustomText(
          textToDisplay: "Hariyanto Lukman",
          textStyle: context.getTextTheme().bodyMedium?.copyWith(color: Colors.white.withOpacity(0.7)),
        ),
      ),
    ],
  ),
);

Widget buildMenuItems(BuildContext context, CharactersController ref) => Container(
  margin: const EdgeInsets.only(top: 20),
  child: Wrap(
    children: [
      charDrawerMenu(context, '${AssetPath.vector}castle.svg', lang(context).allCharacters ?? "All Characters", () async {
        ref.setCurrentPage(PageType.all);
        ref.getCharacters();
        await Future.delayed(const Duration(milliseconds: 500));
        ref.routing.moveBack();
      }),
      charDrawerMenu(context, '${AssetPath.vector}student.svg', lang(context).students ?? "Students", () async {
        ref.setCurrentPage(PageType.students);
        ref.getCharacters();
        await Future.delayed(const Duration(milliseconds: 500));
        ref.routing.moveBack();
      }, size: 40),
      charDrawerMenu(context, '${AssetPath.vector}wizard.svg', lang(context).staff ?? "Staff", () async {
        ref.setCurrentPage(PageType.staff);
        ref.getCharacters();
        await Future.delayed(const Duration(milliseconds: 500));
        ref.routing.moveBack();
      }, size: 40),
      charDrawerMenu(context, '', lang(context).house ?? "House", () async {
        ref.setCurrentPage(PageType.byHouse);
        HouseType? house = await showDialog(context: context, builder: (context){
          return const HousesDialog();
        });
        ref.setHouse(house ?? HouseType.gryffindor);
        ref.getCharacters();
        await Future.delayed(const Duration(milliseconds: 500));
        ref.routing.moveBack();
      }, image: "${AssetPath.image}hogwarts.webp"),
    ],
  ),
);

Widget charDrawerMenu(BuildContext context, String path, String title, Function() onTap, {double size = 32, String? image}){
  return CustomGesture(
    height: 60,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          image == null ? CustomIcon(
            iconData: path,
            defaultColor: false,
            width: size,
            height: size,
          ) : Image.asset(image, width: size, height: size, fit: BoxFit.fitHeight,),
          SizedBox(width: 16 + (32 - size)),
          CustomText(textToDisplay: title, textStyle: context.getTextTheme().bodyLarge,)
        ],
      ),
    ),
  );
}