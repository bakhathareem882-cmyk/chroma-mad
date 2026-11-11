import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/color_swatch.dart';
import 'camera_screen.dart';
import 'saved_screen.dart';
import 'profile_screen.dart';
import 'palette_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  void selectTab(int value) {
    if (value == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const CameraScreen()));
    } else if (value == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const SavedScreen()));
    } else if (value == 3) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
    } else {
      setState(() => index = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CHROMA', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 2))),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          Text('Color starts\nwith inspiration.',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('Create a palette from any image.', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 28),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CameraScreen())),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(20)),
              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.add_a_photo_outlined, color: Colors.white, size: 34),
                SizedBox(height: 28),
                Text('Create a palette', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('Choose an image from your gallery or camera', style: TextStyle(color: Colors.white)),
              ]),
            ),
          ),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('A little inspiration', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PaletteScreen(colors: AppColors.samplePalette, title: 'Earth tones'))), child: const Text('Explore')),
          ]),
          SizedBox(
            height: 120,
            child: Row(children: AppColors.samplePalette.map((color) => Expanded(
              child: ColorSwatchTile(color: color, showHex: false,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PaletteScreen(colors: AppColors.samplePalette, title: 'Earth tones')))),
            )).toList()),
          ),
          const SizedBox(height: 14),
          Card(child: ListTile(
            leading: const Icon(Icons.bookmark_outline),
            title: const Text('Your saved palettes'),
            subtitle: const Text('Keep your favorite color stories together'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SavedScreen())),
          )),
        ],
      ),
      bottomNavigationBar: ChromaBottomNavigation(index: index, onChanged: selectTab),
    );
  }
}
