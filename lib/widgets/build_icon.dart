// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tab_item.dart';
import '../count_style.dart';

class BuildIcon extends StatelessWidget {
  final TabItem item;
  final double iconSize;
  final Color iconColor;
  final CountStyle? countStyle;


  const BuildIcon({
    Key? key,
    required this.item,
    required this.iconColor,
    this.iconSize = 22,
    this.countStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon = SvgPicture.asset(
      item.icon.toString(),
      // size: iconSize,
       color: iconColor,
    );
    if (item.count is Widget) {
      double sizeBadge = countStyle?.size ?? 18;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(item.icon,height: 22,width: 22,color: iconColor),
          // Icon(
          //   item.icon,
          //   size: iconSize,
          //   color: iconColor,
          // ),
          PositionedDirectional(
            start: iconSize - sizeBadge / 2,
            top: -sizeBadge / 2,
            child: item.count!,
          ),
        ],
      );
    }
    return icon;
  }
}
