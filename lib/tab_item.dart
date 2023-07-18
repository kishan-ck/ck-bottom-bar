import 'package:flutter/material.dart';

class TabItem<T> {
  final String icon;
  final String? title;
  final Widget? count;
  final String? key;
  final bool isSelected;

  const TabItem({
    required this.icon,
    this.title,
    this.count,
    this.key,
    this.isSelected = false
  });
}
