import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'image_preview_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final picker = ImagePicker();
  bool loading = false;

  Future<void> chooseImage(ImageSource source) async {
    try {
      setState(() => loading = true);
      final picked = await picker.pickImage(source: source, imageQuality: 90);
      if (!mounted) return;
      setState(() => loading = false);
      if (picked == null) return;
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => ImagePreviewScreen(imageFile: File(picked.path)),
      ));
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not open image: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create palette')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Choose your inspiration', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Select a photo and CHROMA will find its dominant colors.'),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                Icon(Icons.image_search_outlined, size: 64, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 16),
                const Text('Start with a photograph', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 8),
                const Text('A landscape, outfit, room or anything that inspires you.', textAlign: TextAlign.center),
              ]),
            ),
            const Spacer(),
            if (loading) const Center(child: CircularProgressIndicator()) else ...[
              SizedBox(width: double.infinity, height: 54, child: ElevatedButton.icon(
                onPressed: () => chooseImage(ImageSource.gallery),
                icon: const Icon(Icons.photo_library_outlined),
                label: const Text('Choose from gallery'),
              )),
              const SizedBox(height: 12),
              SizedBox(width: double.infinity, height: 54, child: OutlinedButton.icon(
                onPressed: () => chooseImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Take a photo'),
              )),
            ],
          ],
        ),
      ),
    );
  }
}
