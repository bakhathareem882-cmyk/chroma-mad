import 'package:flutter/material.dart';

class ColorSwatchTile extends StatelessWidget {
  final Color color;
  final VoidCallback? onTap;
  final bool showHex;

  const ColorSwatchTile({
    super.key,
    required this.color,
    this.onTap,
    this.showHex = true,
  });

  String get hex =>
      '#${color.value.toRadixString(16).substring(2).toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          if (showHex) ...[
            const SizedBox(height: 7),
            Text(
              hex,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ],
      ),
    );
  }
}
