// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api, avoid_print

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_app/profiles/about%20us/faq_bttom.dart';
import 'package:first_app/profiles/main_profile.dart';
import 'package:flutter/material.dart';

import '../complaint/complaint.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  int _selectedPage = 1; // Initially select the InformationPage.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Information Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'How we reduce Domestic Violence by App:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            "./assets/images/domestic violence.jpg",
            width: 100,
            height: 200,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Domestic violence, also known as family violence or intimate partner violence, is a distressing issue that affects people of all genders, not just women. It involves harmful behaviors within a close relationship, such as emotional, physical, or psychological abuse. Domestic violence can impact anyone, regardless of age, gender, or background."
            "It's crucial to understand that domestic violence is not confined to one gender; it can affect anyone in a relationship. Recognizing the signs, seeking help, and supporting those affected is essential. By raising awareness and fostering a safe environment for everyone, we can work together to combat domestic violence and ensure the well-being of all individuals involved. Mehfooz Aashiyana, our app, is here to help everyone, including men and kids, stay safe and find support. It provides information, resources, and a safe space for you and your loved ones to seek help and build a life free from domestic violence.",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20),
          Text(
            'NGOs Protection:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "./assets/images/Njos.jpg",
          ),
          SizedBox(height: 15),
          Text(
            "The NGO, or Non-Governmental Organization, is like a group of caring people who work to help others and make the world a better place. They have a big heart and a mission to do good things, like stopping domestic violence and keeping families safe."
            "The NGO has some important values, which are like their rules for how they work. They believe in kindness, respect, and helping everyone, no matter who they are. They want to create a world where everyone can feel safe and loved, and they work hard every day to make that happen. They are like superheroes, but instead of capes, they wear kindness and love."
            "The NGO helps the victim and provides all the facilities that victims need, like a safe place to stay and someone to talk to, so they can start feeling better",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromRGBO(106, 127, 247, 1),
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedPage = index; // Update the selected page index.
          });
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ));
          } else {
            print(index);
          }
          if (index == 1) {
            // Check if the "InformationPage" icon is tapped (index 1).
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => InformationPage(),
            ));
          } else if (index == 2) {
            // Check if the "FAQ" icon is tapped (index 2).
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FAQPage(),
            ));
          } else if (index == 3) {
            // Check if the "FAQ" icon is tapped (index 2).
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ComplaintPage(),
            ));
          } else {
            print(index);
          }
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.info_sharp,
            color: Colors.white,
          ),
          Icon(
            Icons.message,
            color: Colors.white,
          ),
          Icon(
            Icons.warning,
            color: Colors.white,
          ),
        ],
        index: _selectedPage, // Set the selected index.
      ),
    );
  }
}
