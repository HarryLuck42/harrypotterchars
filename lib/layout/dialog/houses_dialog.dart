
import 'package:flutter/material.dart';
import 'package:my_products/core/constraint/enum.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/widgets/custom_text.dart';

import '../../core/constraint/asset_path.dart';
import '../../core/constraint/const.dart';
import '../../core/constraint/spacer.dart';

class HousesDialog extends StatelessWidget {
  const HousesDialog({super.key});



  @override
  Widget build(BuildContext context) {

    final heightDialog = context.getHeight() * 0.8;
    final widthDialog = context.getWidth() * 0.9;
    return AlertDialog(
      backgroundColor: context.getColorScheme().onSecondary,
      content: Builder(builder: (context) {
        return Container(
          height: heightDialog,
          width: widthDialog,
          decoration:
          BoxDecoration(color: context.getColorScheme().onSecondary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: CustomText(textToDisplay: "The Houses of Hogwarts", textStyle: context.getTextTheme().titleSmall,),
              ),
              eightPx,
              Expanded(
                child: _housesLayout(context),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _housesLayout(BuildContext context) {
    List<HouseType> houses = [HouseType.gryffindor, HouseType.slytherin, HouseType.hufflepuff, HouseType.ravenclaw,];
    return SingleChildScrollView(
      child: Column(
        children: List.generate(houses.length, (index) {
          return Column(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context, houses[index]);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            left: 10, top: 5, bottom: 5, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              houseIcon[houseMap[houses[index]]] ??
                                  "${AssetPath.image}hogwarts.webp",
                              width: 30,
                              height: 30,
                              fit: BoxFit.fitHeight,
                            ),
                            tenPx,
                            Expanded(
                              child: CustomText(
                                textToDisplay: houseMap[houses[index]] ?? '-',
                                textAlign: TextAlign.start,
                                textStyle: context
                                    .getTextTheme()
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: context.getTheme().colorScheme.secondary,
              )
            ],
          );
        }),
      ),
    );
  }
}
