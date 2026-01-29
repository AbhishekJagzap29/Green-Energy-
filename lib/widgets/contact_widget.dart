import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _contactTile(Icons.phone, 'Phone', '+91 9890954640'),
          _contactTile(FontAwesomeIcons.whatsapp, 'WhatsApp', '+91 9890954640'),
          _contactTile(Icons.email, 'Email', 'pundlikjagzap@gmail.com'),
          _contactTile(Icons.location_on, 'Address',
              'Plot no 14, Kalindi Nagar, Station Road, Kopargaon'),
        ],
      ),
    );
  }

  Widget _contactTile(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        subtitle: Text(value),
        onTap: () async {
          if (title == 'Phone') {
            final Uri phoneUri = Uri(scheme: 'tel', path: value);
            if (await canLaunchUrl(phoneUri)) {
              await launchUrl(phoneUri);
            }
          } else if (title == 'WhatsApp') {
            final Uri whatsappUri = Uri.parse(
              'https://wa.me/919890954640',
            );

            if (await canLaunchUrl(whatsappUri)) {
              await launchUrl(
                whatsappUri,
                mode: LaunchMode.externalApplication,
              );
            } else {}
          } else if (title == 'Email') {
            final Uri emailUri = Uri(scheme: 'mailto', path: value);
            if (await canLaunchUrl(emailUri)) {
              await launchUrl(emailUri);
            }
          } else if (title == 'Address') {
            final Uri mapUri = Uri.parse(
              'https://maps.app.goo.gl/pnPfindyoMBMDxSz7?g_st=aw',
            );

            if (await canLaunchUrl(mapUri)) {
              await launchUrl(
                mapUri,
                mode: LaunchMode.externalApplication,
              );
            }
          }
        },
      ),
    );
  }
}
