import 'package:flutter/material.dart';
import '../widgets/contact_widget.dart'; // make sure the path is correct

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.green,
      ),
      body: const SingleChildScrollView(
        child: ContactWidget(),
      ),
    );
  }
}
