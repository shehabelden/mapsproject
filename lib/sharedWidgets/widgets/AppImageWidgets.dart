// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

class AppImages {
  assetImage(String path) {
    return Image.asset(path);
  }

  assetImageWithWidthAndHeight(String path, double width, double height) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }

  assetImageWithWidthAndHeightAndColor(
      String path, double width, double height, Color color) {
    return Image.asset(
      path,
      width: width,
      height: height,
      color: color,
    );
  }

  assetImageWithColor(String path, Color color) {
    return Image.asset(
      path,
      color: color,
    );
  }

  networkImage(String path) {
    return Image.network(
      path,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return assetImage(path);
      },
    );
  }
}
