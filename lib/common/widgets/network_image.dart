import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui_web' as ui;

import 'package:sizer/sizer.dart';

class NetworkImageCustom extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const NetworkImageCustom(
      {super.key, required this.imageUrl, required this.radius});
  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int viewId) => ImageElement()
        ..style.width = '100%' //or '0%'-'100%'
        ..style.height = '100%' //or '0%'-'100%'
        ..src = imageUrl,
    );
    return Container(
        width: 80.h,
        height: 50.h,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: HtmlElementView(
              viewType: imageUrl,
            )));
  }
}
