import 'dart:io';
import 'package:flutter/material.dart';
import '../models/palette_model.dart';
import '../services/storage_service.dart';
import 'palette_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late Future<List<PaletteModel>> palettes;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() => palettes = StorageService.getPalettes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved palettes')),
      body: FutureBuilder<List<PaletteModel>>(
        future: palettes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = snapshot.data ?? [];
          if (items.isEmpty) {
            return Center(child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.bookmark_border, size: 56),
                const SizedBox(height: 14),
                Text('No saved palettes yet', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                const Text('Create a palette and save it to see it here.', textAlign: TextAlign.center),
              ]),
            ));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 14),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: SizedBox(
                    width: 86,
                    child: Row(children: item.colorValues.take(4).map((c) => Expanded(child: Container(color: c))).toList()),
                  ),
                  title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${item.colors.length} colors · ${item.createdAt.toLocal().toString().split(" ").first}'),
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (_) => PaletteScreen(
                      colors: item.colorValues,
                      imagePath: item.imagePath != null && File(item.imagePath!).existsSync() ? item.imagePath : null,
                      title: item.name,
                    ),
                  )).then((_) => setState(refresh)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () async {
                      await StorageService.deletePalette(item.id);
                      setState(refresh);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
