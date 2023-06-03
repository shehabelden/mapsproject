// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomListViewBuilder extends StatelessWidget {
  final Widget widget;
  final int itemCount;
  final ScrollPhysics? scrollPhysics;
  const CustomListViewBuilder({
    Key? key,
    required this.widget,
    required this.itemCount,
    this.scrollPhysics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        physics: scrollPhysics ?? const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return widget;
        });
  }
}
