// ignore_for_file: file_names

import 'package:flutter/material.dart';

appModelBottomSheet(BuildContext context, Widget widget) {
  return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return widget;
      });
}
