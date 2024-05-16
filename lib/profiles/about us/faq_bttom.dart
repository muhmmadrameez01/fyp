// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_app/profiles/about%20us/aboutinfo.dart';
import 'package:first_app/profiles/main_profile.dart';
import 'package:flutter/material.dart';

import '../complaint/complaint.dart';

void main() {
  runApp(MaterialApp(
    home: FAQPage(),
  ));
}

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  int _selectedPage = 2;
  List<bool> isExpandedList = List.filled(6, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('FAQ'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            './assets/images/help signal.jpg',
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                FAQItem(
                  question: 'What is domestic violence?',
                  answer:
                      'Domestic violence, also known as family violence or intimate partner violence, is a distressing issue that affects people of all genders. It involves harmful behaviors within a close relationship, such as emotional, physical, or psychological abuse. Domestic violence can impact anyone, regardless of age, gender, or background.',
                  isExpanded: isExpandedList[0],
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpandedList[0] = value;
                    });
                  },
                ),
                FAQItem(
                  question: 'Who can be affected by domestic violence?',
                  answer:
                      "Domestic violence is not confined to one gender; it can affect anyone in a relationship. It can impact individuals of all ages, genders, and backgrounds. It's essential to recognize the signs, seek help, and provide support to those affected",
                  isExpanded: isExpandedList[1],
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpandedList[1] = value;
                    });
                  },
                ),
                FAQItem(
                  question:
                      'How can I help someone experiencing domestic violence?',
                  answer:
                      'If you know someone experiencing domestic violence, the first step is to offer your support and let them know you are there for them. Encourage them to seek professional help and provide them with resources such as our app, Mehfooz Aashiyana. This app offers information and a safe space for those affected by domestic violence to find support and assistance.',
                  isExpanded: isExpandedList[2],
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpandedList[2] = value;
                    });
                  },
                ),
                FAQItem(
                  question: 'What are NGOs and how do they help?',
                  answer:
                      'NGOs (Non-Governmental Organizations) are groups of caring individuals working to make the world a better place. They aim to stop domestic violence and create a safe environment for families. NGOs follow values like kindness, respect, and helping everyone, regardless of who they are. They provide support to victims, including a safe place to stay and someone to talk to.',
                  isExpanded: isExpandedList[3],
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpandedList[3] = value;
                    });
                  },
                ),
                FAQItem(
                  question:
                      'How can I recognize the signs of domestic violence?',
                  answer:
                      'Recognizing the signs of domestic violence is crucial. Some common signs include physical injuries, emotional distress, controlling behavior by the abuser, isolation from friends and family, and a fear of the partner. If you suspect someone is a victim, encourage them to seek help and support them in finding resources for assistance.',
                  isExpanded: isExpandedList[4],
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpandedList[4] = value;
                    });
                  },
                ),
                FAQItem(
                  question:
                      'Is it possible to break the cycle of domestic violence?',
                  answer:
                      'Yes, it is possible to break the cycle of domestic violence. Seeking help from professionals, such as counselors or support groups, is essential. Victims can also access resources like our app, Mehfooz Aashiyana, to find information and support. Remember, you are not alone, and there is help available to break free from domestic violence and build a safe and healthy life.',
                  isExpanded: isExpandedList[5],
                  onExpansionChanged: (value) {
                    setState(() {
                      isExpandedList[5] = value;
                    });
                  },
                ),
              ],
            ),
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

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final ValueChanged<bool>? onExpansionChanged;

  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
    this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            answer,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
      initiallyExpanded: isExpanded,
      onExpansionChanged: onExpansionChanged,
    );
  }
}
