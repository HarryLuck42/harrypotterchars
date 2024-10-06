import 'package:flutter/material.dart';
import 'package:my_products/app.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/character_detail/components/detail_widgets.dart';
import '../../../initial/locale/localizations.dart';
import '../../../widgets/custom_text.dart';
import '../character_detail_controller.dart';

class SecondBodyDetail extends StatelessWidget {
  final CharacterDetailController ref;

  const SecondBodyDetail({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final detail = ref.detail.value;
    final isWandEmpty = (detail?.wand?.wood?.isNullEmpty() ?? true) &&
        (detail?.wand?.core?.isNullEmpty() ?? true) &&
        detail?.wand?.length == null;
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          detailItems(lang(context).alternateNames ?? "Alternate Names",
              detail?.alternateNames ?? [],
              flexTitle: 2, flexValue: 4),
          fourPx,
          detailItems(lang(context).alternateActors ?? "Alternate Actors",
              detail?.alternateActors ?? [],
              flexTitle: 2, flexValue: 4),
          fourPx,
          CustomText(
              textToDisplay: "${lang(context).wand ?? "Wand"}:",
              textAlign: TextAlign.start,
              textStyle: context
                  .getTextTheme()
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w700)),
          fourPx,
          isWandEmpty
              ? CustomText(
                  textToDisplay: "No Data Wand",
                  textStyle: context.getTextTheme().bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                        color:
                            context.getColorScheme().secondary.withOpacity(0.5),
                      ),
                )
              : Column(
                  children: [
                    detailItem(
                        lang(context).wood ?? "Wood", detail?.wand?.wood ?? "-",
                        flexTitle: 2, flexValue: 4),
                    detailItem(
                        lang(context).core ?? "Core", detail?.wand?.core ?? "-",
                        flexTitle: 2, flexValue: 4),
                    detailItem(lang(context).length ?? "Length",
                        "${detail?.wand?.wood ?? " - "} cm",
                        flexTitle: 2, flexValue: 4)
                  ],
                )
        ],
      ),
    );
  }
}
