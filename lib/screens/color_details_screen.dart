import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorDetailsScreen extends StatelessWidget {
  final Color color;
  const ColorDetailsScreen({super.key, required this.color});

  String get hex => '#${color.value.toRadixString(16).substring(2).toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    final hsl = HSLColor.fromColor(color);
    final r = (color.r * 255).round();
    final g = (color.g * 255).round();
    final b = (color.b * 255).round();
    final shades = List.generate(7, (i) {
      final lightness = (hsl.lightness + (i - 3) * 0.12).clamp(0.08, 0.92);
      return hsl.withLightness(lightness).toColor();
    });

    Widget valueRow(String label, String value) => ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: IconButton(
        icon: const Icon(Icons.copy),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: value));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$label copied')));
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Color details')),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          Container(height: 190, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20))),
          const SizedBox(height: 20),
          Text(hex, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          valueRow('HEX', hex),
          valueRow('RGB', 'rgb($r, $g, $b)'),
          valueRow('HSL', 'hsl(${hsl.hue.round()}, ${hsl.saturation.toStringAsFixed(2)}, ${hsl.lightness.toStringAsFixed(2)})'),
          const SizedBox(height: 14),
          Text('Shades & tints', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(children: shades.map((shade) => Expanded(
            child: Container(height: 76, color: shade),
          )).toList()),
        ],
      ),
    );
  }
}
