import 'package:flutter/material.dart';

class PaletteModel {
  final String id;
  final String name;
  final List<int> colors;
  final String? imagePath;
  final DateTime createdAt;

  PaletteModel({
    required this.id,
    required this.name,
    required this.colors,
    this.imagePath,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  List<Color> get colorValues => colors.map((value) => Color(value)).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'colors': colors,
        'imagePath': imagePath,
        'createdAt': createdAt.toIso8601String(),
      };

  factory PaletteModel.fromJson(Map<String, dynamic> json) => PaletteModel(
        id: json['id'] as String,
        name: json['name'] as String? ?? 'My Palette',
        colors: (json['colors'] as List).map((e) => e as int).toList(),
        imagePath: json['imagePath'] as String?,
        createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ??
            DateTime.now(),
      );
}
