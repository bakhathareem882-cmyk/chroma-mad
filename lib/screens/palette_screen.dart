import 'dart:io';
import 'package:flutter/material.dart';
import '../models/palette_model.dart';
import '../services/storage_service.dart';
import '../widgets/color_swatch.dart';
import 'color_details_screen.dart';

class PaletteScreen extends StatelessWidget {
  final List<Color> colors;
  final String? imagePath;
  final String title;

  const PaletteScreen({
    super.key,
    required this.colors,
    this.imagePath,
    this.title = 'Generated palette',
  });

  Future<void> save(BuildContext context) async {
    final palette = PaletteModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: title,
      colors: colors.map((c) => c.value).toList(),
      imagePath: imagePath,
    );
    await StorageService.savePalette(palette);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Palette saved!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          if (imagePath != null && File(imagePath!).existsSync())
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.file(File(imagePath!), height: 220, width: double.infinity, fit: BoxFit.cover),
            ),
          const SizedBox(height: 24),
          Text('Your colors', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Tap any color to explore its values and shades.'),
          const SizedBox(height: 22),
          SizedBox(
            height: 230,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: colors.asMap().entries.map((entry) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: ColorSwatchTile(
                    color: entry.value,
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (_) => ColorDetailsScreen(color: entry.value),
                    )),
                  ),
                ),
              )).toList(),
            ),
          ),
          const SizedBox(height: 26),
          SizedBox(width: double.infinity, height: 54, child: ElevatedButton.icon(
            onPressed: () => save(context),
            icon: const Icon(Icons.bookmark_add_outlined),
            label: const Text('Save palette'),
          )),
        ],
      ),
    );
  }
}
