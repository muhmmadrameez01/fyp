// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ProjectReferencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Reference'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 15,),
         Image.asset(
          'assets/images/reference.jpg',
           height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Project Overview',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'The Domestic Violence Support App is a mobile application designed to act as a bridge between domestic violence victims and Non-Governmental Organizations (NGOs) providing support and assistance. The app aims to empower individuals who may be experiencing domestic violence by offering them a safe and confidential platform to seek help, access resources, and connect with NGOs dedicated to addressing domestic violence issues.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Key Features',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User Registration and Profiles:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Users can create accounts and maintain profiles with essential information for communication and support.",
                    ),
                    
                SizedBox(height: 10),
                Text(
                  "Resource Directory:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                 Text(
                  "Immediate access to emergency contact numbers and services for users in distress.",
                ),
                 SizedBox(height: 10),
                Text(
                  "Emergency Assistance:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Comprehensive directory of local and national NGOs and support organizations.",
                ),
                SizedBox(height: 10),
                Text(
                  "Chat and Communication:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Secure and anonymous messaging system for users to reach out to NGOs and seek assistance.",
                ),
                SizedBox(height: 10),
                Text(
                  "Information and Education:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Educational resources and information about domestic violence, its signs, and legal rights.",
                ),
                SizedBox(height: 10),
                Text(
                  "Feedback and Reporting:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "A feature for users to provide feedback, share their experiences, and report incidents anonymously.",
                ),
                SizedBox(height: 10),
                Text(
                  "Safety Planning:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Tools and resources for users to create safety plans to protect themselves.",
                ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
