import 'package:flutter/material.dart';
import 'package:my_products/core/constraint/asset_path.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/initial/locale/localizations.dart';

import '../../../core/constraint/spacer.dart';
import '../../../widgets/custom_image_network.dart';
import '../character_detail_controller.dart';
import 'detail_widgets.dart';

class FirstBodyDetail extends StatelessWidget {
  final CharacterDetailController ref;

  const FirstBodyDetail({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final detail = ref.detail.value;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (detail?.image?.isNullEmpty() ?? true)
              ? Container(
                  width: 130,
                  height: 190,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.24),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: Offset(
                            0,
                            3,
                          ),
                        ),
                      ],
                      color: context.getColorScheme().secondaryContainer),
                  child: Image.asset("${AssetPath.image}harry_potter.webp"),
                )
              : CustomImageNetwork(
                  imageUrl: detail?.image ?? "",
                  width: 130,
                  height: 190,
                  fit: BoxFit.contain,
                ),
          eightPx,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                detailItem(
                    lang(context).species ?? "Species", detail?.species?.getRealValue() ?? "-"),
                fourPx,
                detailItem(
                    lang(context).gender ?? "Gender", detail?.gender?.getRealValue() ?? "-"),
                fourPx,
                detailItem(lang(context).ancestry ?? "Ancestry",
                    detail?.ancestry?.getRealValue() ?? "-"),
                fourPx,
                detailItem(lang(context).eyesColour ?? "Eyes Colour",
                    detail?.eyeColour?.getRealValue() ?? "-"),
                fourPx,
                detailItem(lang(context).hairColour ?? "Hair Colour",
                    detail?.hairColour?.getRealValue() ?? "-"),
                fourPx,
                detailItem(
                    lang(context).actor ?? "Actor", detail?.actor?.getRealValue() ?? "-"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
