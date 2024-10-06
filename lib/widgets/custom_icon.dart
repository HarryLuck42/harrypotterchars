import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_products/core/extention/extention.dart';

class CustomIcon extends StatelessWidget {
  final Color? color;
  final String iconData;
  final double? width;
  final double? height;
  final bool defaultColor;
  const CustomIcon({
    Key? key,
    required this.iconData,
    this.color,
    this.width,
    this.height,
    this.defaultColor = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SvgPicture.asset(
        iconData,
        width: width,
        height: height,
        color: defaultColor ? context.getColorScheme().secondary : color,
        allowDrawingOutsideViewBox: true,
      ),
    );
  }
}