import 'package:flutter/material.dart';
import 'package:solar/screens/rooftop_screen.dart';
import 'package:solar/screens/solar_water_heater_screen.dart';
import '/screens/contact_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.green),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Solar Solutions',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 8),
              Text(
                'Clean Energy for Future',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          leading: const Icon(Icons.water),
          title: const Text('Solar Water Heater'),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SolarWaterHeaterScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.solar_power),
          title: const Text('Solar Rooftop'),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RooftopSystemScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.call),
          title: const Text('Contact Us'),
          // onTap: () {},
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
