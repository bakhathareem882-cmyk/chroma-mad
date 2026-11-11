import 'dart:io';
import 'package:flutter/material.dart';
import '../services/color_extraction_service.dart';
import 'palette_screen.dart';

class ImagePreviewScreen extends StatefulWidget {
  final File imageFile;
  const ImagePreviewScreen({super.key, required this.imageFile});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  bool loading = false;

  Future<void> generate() async {
    setState(() => loading = true);
    try {
      final colors = await ColorExtractionService.extract(widget.imageFile);
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => PaletteScreen(
          colors: colors,
          imagePath: widget.imageFile.path,
          title: 'My new palette',
        ),
      ));
    } catch (e) {
      if (!mounted) return;
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not generate palette: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image preview')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.file(widget.imageFile, width: double.infinity, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(width: double.infinity, height: 54, child: ElevatedButton(
            onPressed: loading ? null : generate,
            child: loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Generate palette'),
          )),
        ]),
      ),
    );
  }
}
