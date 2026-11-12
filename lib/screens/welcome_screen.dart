import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text('CHROMA', style: TextStyle(letterSpacing: 4, fontWeight: FontWeight.w800)),
              const SizedBox(height: 30),
              Text('Find the colors\nin everything.',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold, height: 1.1)),
              const SizedBox(height: 18),
              Text('Turn the images you love into palettes you can save, explore and use.',
                style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 38),
              Row(children: AppColors.samplePalette.map((c) => Expanded(
                child: Container(height: 100, color: c),
              )).toList()),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const HomeScreen()),
                  ),
                  child: const Text('Get started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
