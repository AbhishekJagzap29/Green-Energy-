import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:solar/main.dart';
import 'login_screen.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  void _selectLanguage(BuildContext context, Locale locale) {
    // Change app language globally
    MyApp.of(context).changeLanguage(locale);

    // Navigate to Login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t.selectLanguage,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _selectLanguage(context, const Locale('en')),
              child: Text(t.english),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => _selectLanguage(context, const Locale('mr')),
              child: Text(t.marathi),
            ),
          ],
        ),
      ),
    );
  }
}
