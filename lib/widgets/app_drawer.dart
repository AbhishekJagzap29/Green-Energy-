import 'package:flutter/material.dart';
import 'package:solar/screens/rooftop_screen.dart';
import 'package:solar/screens/solar_water_heater_screen.dart';
import 'package:solar/screens/contact_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.green),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.drawerTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                t.drawerSubtitle,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: Text(t.menuHome),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          leading: const Icon(Icons.water),
          title: Text(t.menuSolarHeater),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SolarWaterHeaterScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.solar_power),
          title: Text(t.menuSolarRooftop),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const RooftopSystemScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.call),
          title: Text(t.menuContact),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ContactScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
