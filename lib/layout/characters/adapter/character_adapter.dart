import 'package:flutter/material.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/model/local/character_data.dart';
import 'package:my_products/widgets/custom_gesture.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/const.dart';
import '../../../core/routing/routes.dart';
import '../../../core/themes/app_colors.dart';
import '../../../widgets/custom_image_network.dart';
import '../../../widgets/custom_text.dart';
import '../characters_controller.dart';

class CharacterAdapter extends StatefulWidget {
  final CharacterData character;
  final int position;
  final CharactersController ref;

  const CharacterAdapter(
      {super.key,
      required this.character,
      required this.position,
      required this.ref});

  @override
  State<CharacterAdapter> createState() => _CharacterAdapterState();
}

class _CharacterAdapterState extends State<CharacterAdapter> {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = context.getHeight();
    final double itemWidth = context.getWidth();
    return Container(
      width: (itemWidth / 2) - 8,
      height: itemHeight * 0.5,
      margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
      child: CustomGesture(
        onTap: () {
          widget.ref.routing
              .move(Routes.characterDetail, argument: widget.character);
        },
        radius: 12,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 2.6,
                  spreadRadius: 0,
                  offset: Offset(
                    1.95,
                    1.95,
                  ),
                ),
              ],
              color: context.getColorScheme().secondaryContainer),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
                child: CustomImageNetwork(
                  imageUrl: widget.character.image ?? "",
                  width: double.infinity,
                  height: itemHeight * 0.35,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: GreyLight,
              ),
              tenPx,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  fourPx,
                  Image.asset(
                    houseIcon[widget.character.house] ??
                        "${AssetPath.image}hogwarts.webp",
                    width: 50,
                    height: 50,
                    fit: BoxFit.fitHeight,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only( left: 10, right: 10),
                          child: CustomText(
                            textToDisplay: widget.character.name ?? "",
                            textStyle: context
                                .getTextTheme()
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: CustomText(
                            textToDisplay: widget.character.actor ?? "",
                            maxLines: 2,
                            textStyle: context
                                .getTextTheme()
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
