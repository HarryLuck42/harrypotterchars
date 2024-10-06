import 'package:flutter/material.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/widgets/custom_elevated_button.dart';
import 'package:my_products/widgets/custom_text.dart';

import '../../widgets/custom_search.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchCtrl = TextEditingController();
    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: context.getColorScheme().onSecondary),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: CustomSearch(
                  controller: searchCtrl,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10 * context.scaleDiagonal()),
                  hintText: lang(context).search ?? 'Search',
                ),
              ),
              tenPx,
              CustomElevatedButton(
                  width: 100,
                  height: 40,
                  function: () {
                    Navigator.pop(context, searchCtrl.text);
                  },
                  child: CustomText(
                    textToDisplay: lang(context).search ?? "Search",
                    textStyle: context
                        .getTextTheme()
                        .bodySmall
                        ?.copyWith(color: context.getColorScheme().onPrimary),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
