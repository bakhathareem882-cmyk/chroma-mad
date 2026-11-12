import 'package:flutter/material.dart';
import '../theme/theme_controller.dart';
import 'signin_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = themeModeNotifier.value == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile & settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 12),
          CircleAvatar(
            radius: 42,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(Icons.person_outline, size: 42, color: Colors.white),
          ),
          const SizedBox(height: 14),
          const Center(child: Text('CHROMA CREATOR', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5))),
          const SizedBox(height: 28),
          Card(child: SwitchListTile(
            secondary: const Icon(Icons.dark_mode_outlined),
            title: const Text('Dark mode'),
            subtitle: const Text('Use a darker appearance'),
            value: isDark,
            onChanged: (value) => themeModeNotifier.value = value ? ThemeMode.dark : ThemeMode.light,
          )),
          Card(child: ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text('About CHROMA'),
            subtitle: const Text('A simple studio for exploring color.'),
            onTap: () => showAboutDialog(
              context: context,
              applicationName: 'CHROMA',
              applicationVersion: '1.0.0',
              applicationLegalese: 'Color Palette Studio',
            ),
          )),
          Card(child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign out'),
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const SignInScreen()),
              (route) => false,
            ),
          )),
        ],
      ),
    );
  }
}
