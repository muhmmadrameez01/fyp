// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  'assets/images/help.png', // Replace with the actual path to your image
                  // height: 220, // Adjust the height as needed
                  // width: double.infinity, // Set the width to fill the screen
                  // fit:
                  //     BoxFit.cover, // Adjust the fit to your image's aspect ratio
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If you need assistance or have any questions, please contact us:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Email: support@example.com',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Phone: +1 (123) 456-7890',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Frequently Asked Questions (FAQ)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                  'How do I reset my password?',
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  'You can reset your password by clicking on the "Forgot Password" link on the login page.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                title: Text(
                  'What are the system requirements?',
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  'Our app is compatible with both Android and iOS devices. You can find the specific requirements in the app store listings.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                title: Text(
                  'How can I contact support?',
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  'You can contact our support team via email at support@example.com or by phone at +1 (123) 456-7890.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
