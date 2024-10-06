import 'package:flutter/material.dart';
import 'package:my_products/core/constraint/const.dart';
import 'package:my_products/core/constraint/sp_keys.dart';
import 'package:my_products/core/extention/extention.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/spacer.dart';
import '../../../widgets/custom_text.dart';
import '../character_detail_controller.dart';

class HeaderDetail extends StatelessWidget {
  final CharacterDetailController ref;

  const HeaderDetail({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final detail = ref.detail.value;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
          child: Image.asset(
            houseIcon[detail?.house] ?? "${AssetPath.image}hogwarts.webp",
            width: 50,
            height: 50,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (detail?.name?.length ?? 0) > 17
                      ? Expanded(
                          child: CustomText(
                            textToDisplay: detail?.name ?? "-",
                            textStyle: context.getTextTheme().titleSmall,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                          ),
                        )
                      : CustomText(
                          textToDisplay: detail?.name ?? "-",
                          textStyle: context.getTextTheme().titleSmall,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                  fourPx,
                  CustomText(
                    textToDisplay: (detail?.hogwartsStudent ?? false)
                        ? "(Student)"
                        : (detail?.hogwartsStaff ?? false)
                            ? "(Staff)"
                            : "",
                    textStyle: context
                        .getTextTheme()
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              (detail?.dateOfBirth.isNullEmpty() ?? true) ? CustomText(textToDisplay: "Birthday is not identified", textStyle: context
                  .getTextTheme()
                  .bodySmall
                  ?.copyWith(color: context.getColorScheme().secondary.withOpacity(0.5))): CustomText(
                textToDisplay: detail?.dateOfBirth?.convert("dd MMM yyyy",
                    ref.sharedPre.readStorage(SpKeys.locale)) ??
                    "-",
                textStyle: context
                    .getTextTheme()
                    .bodySmall
                    ?.copyWith(color: context.getColorScheme().secondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
