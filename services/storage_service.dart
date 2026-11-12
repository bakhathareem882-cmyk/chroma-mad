import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/palette_model.dart';

class StorageService {
  static const _key = 'chroma_saved_palettes';

  static Future<List<PaletteModel>> getPalettes() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return [];
    try {
      final decoded = jsonDecode(raw) as List;
      return decoded
          .map((item) => PaletteModel.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> savePalette(PaletteModel palette) async {
    final palettes = await getPalettes();
    palettes.removeWhere((item) => item.id == palette.id);
    palettes.insert(0, palette);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(palettes.map((item) => item.toJson()).toList()),
    );
  }

  static Future<void> deletePalette(String id) async {
    final palettes = await getPalettes();
    palettes.removeWhere((item) => item.id == id);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(palettes.map((item) => item.toJson()).toList()),
    );
  }
}
