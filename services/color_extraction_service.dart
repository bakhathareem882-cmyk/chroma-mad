import 'dart:io';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorExtractionService {
  static Future<List<Color>> extract(File imageFile) async {
    final generator = await PaletteGenerator.fromImageProvider(
      FileImage(imageFile),
      maximumColorCount: 8,
    );
    final colors = <Color>[
      ...generator.colors,
    ];
    if (colors.isEmpty && generator.dominantColor != null) {
      colors.add(generator.dominantColor!.color);
    }
    while (colors.length < 5) {
      colors.add(const Color(0xFFB5A0C9));
    }
    return colors.take(5).toList();
  }
}
