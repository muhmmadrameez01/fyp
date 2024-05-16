// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CounselingPage extends StatelessWidget {
   _launchYouTubeURL() async {
    const url = "https://www.google.com"; 
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counseling Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Counseling Service',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/counselling.jpeg',
              ),
              SizedBox(height: 20),
              RichText(
  text: TextSpan(
    style: TextStyle(
      fontSize: 16,
      color: Colors.black, // Customize the text color
    ),
    children: <TextSpan>[
      TextSpan(
        text: 'Our counseling service is here to provide support and guidance to individuals and families who are experiencing domestic violence or related issues. Counseling is beneficial for:\n\n',
        // Set maxLines to ensure consistent line endings
        children: <TextSpan>[
          TextSpan(
            text: '1. Victims of Domestic Violence: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'If you or someone you know has experienced domestic violence, counseling can help you cope with the trauma, heal emotionally, and develop strategies to rebuild your life in a safe and healthy way.\n\n',
          ),
          TextSpan(
            text: '2. Survivors: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Even if you\'ve escaped an abusive relationship, counseling can assist survivors in addressing the emotional scars and moving forward towards a brighter future.\n\n',
          ),
          TextSpan(
            text: '3. Children and Teens: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Children who have witnessed or experienced domestic violence may require counseling to process their feelings and emotions, as it can have a lasting impact on their mental well-being.\n\n',
          ),
          TextSpan(
            text: '4. Families: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Counseling can help families affected by domestic violence rebuild trust, communication, and support systems while addressing the impact of the abuse on family dynamics.\n\n',
          ),
          TextSpan(
            text: '5. Individuals Dealing with Related Issues: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Counseling is not limited to domestic violence victims alone. It\'s a valuable resource for anyone dealing with trauma, stress, anxiety, depression, or relationship challenges.\n',
          ),
        ],
      ),
    ],
  ),
),

    ElevatedButton(
                onPressed: _launchYouTubeURL,
                child: Text('Watch Counseling Video'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
