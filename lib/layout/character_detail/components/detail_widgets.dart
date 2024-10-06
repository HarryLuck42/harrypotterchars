import 'package:flutter/material.dart';

import '../../../core/constraint/spacer.dart';
import '../../../widgets/custom_text.dart';

Widget detailItem(String title, String value,
    {int flexTitle = 2, int flexValue = 3}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: flexTitle,
        child: CustomText(
          textToDisplay: title,
          textAlign: TextAlign.start,
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      const CustomText(textToDisplay: ":"),
      fourPx,
      Expanded(
        flex: flexValue,
        child: CustomText(
          textToDisplay: value,
          textAlign: TextAlign.start,
          maxLines: 3,
        ),
      ),
    ],
  );
}

Widget detailItems(String title, List<String?> values, {int flexTitle = 13, int flexValue = 10}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          flex: flexTitle,
          child: CustomText(
            textToDisplay: title,
            textAlign: TextAlign.start,
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          )),
      const CustomText(textToDisplay: ":"),
      fourPx,
      Expanded(
        flex: flexValue,
        child: Builder(
          builder: (context) {
            String data = "";
            if (values.length > 2) {
              for (int i = 0; i < values.length; i++) {
                if (i == values.length - 1) {
                  data += "& ${values[i]}";
                } else if (i == values.length - 2) {
                  data += "${values[i]} ";
                } else {
                  data += "${values[i]}, ";
                }
              }
            } else {
              if (values.isEmpty) {
                data = "-";
              } else if (values.length == 1) {
                data = values[0] ?? "-";
              } else {
                data = "${values[0]} & ${values[1]}";
              }
            }

            return CustomText(
              textToDisplay: data,
              textAlign: TextAlign.start,
              maxLines: 3,
            );
          },
        ),
      ),
    ],
  );
}
