import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'welcome_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool hidePassword = true;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void continueToApp() {
    if (email.text.trim().isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter your email and password.')),
      );
      return;
    }
    if (!email.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid email address.')),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).colorScheme.onSurface;
    final secondary = Theme.of(context).textTheme.bodyMedium?.color;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.palette_outlined, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Text('CHROMA', style: TextStyle(
                      color: text, fontSize: 18, fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                    )),
                  ]),
                  const SizedBox(height: 54),
                  Row(children: AppColors.samplePalette.map((c) => Expanded(
                    child: Container(
                      height: 62,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(8)),
                    ),
                  )).toList()),
                  const SizedBox(height: 32),
                  Text('Welcome\nback.', style: TextStyle(
                    color: text, fontSize: 43, height: 1.1,
                    fontWeight: FontWeight.w700, letterSpacing: -1.5,
                  )),
                  const SizedBox(height: 12),
                  Text('Sign in to continue creating beautiful color combinations.',
                    style: TextStyle(color: secondary, height: 1.5)),
                  const SizedBox(height: 34),
                  const Text('EMAIL ADDRESS', style: TextStyle(fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 9),
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.mail_outline),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text('PASSWORD', style: TextStyle(fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 9),
                  TextField(
                    controller: password,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => hidePassword = !hidePassword),
                        icon: Icon(hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(onPressed: continueToApp, child: const Text('Sign In')),
                  ),
                  const SizedBox(height: 22),
                  Center(child: TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WelcomeScreen())),
                    child: const Text('Continue as a guest'),
                  )),
                  const SizedBox(height: 22),
                  Center(child: Text('YOUR COLORS. YOUR CREATIVITY.',
                    style: TextStyle(color: secondary, fontSize: 10, letterSpacing: 1.8))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
