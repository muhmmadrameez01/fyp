// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  Color feedbackLabelColor = Colors.black;

  void changeFeedbackLabelColor() {
    setState(() {
      feedbackLabelColor = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Feedback'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.feedback,
                  size: 80.0,
                  color: Colors.blue,
                ),
                SizedBox(height: 20),
                Text(
                  'Share Your Feedback',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact Information',
                    prefixIcon: Icon(Icons.contact_mail),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Your Feedback',
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true, // Align label with the hint text
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement feedback submission logic here
                  },
                  child: Text('Submit Feedback'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
