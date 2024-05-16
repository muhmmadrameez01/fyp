// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_import, must_be_immutable, library_private_types_in_public_api, unnecessary_import, unused_element, sort_child_properties_last, override_on_non_overriding_member, camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhysiatristAdvicePage(),
    );
  }
}

class PhysiatristAdvicePage extends StatelessWidget {
  List names = ["Phychiatrist1", "Phychiatrist2", "Phychiatrist3", "Phychiatrist4", "Phychiatrist5"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1, // Set the initial index to Lawyer List
      child: Scaffold(
        appBar: AppBar(
          title: Text('Phychiatrist Advise'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Phychiatrists'),
              Tab(text: 'Guidance'),
              Tab(text: 'FAQ'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Lawyer List Section with Image
            Container(
              color: Color.fromRGBO(245, 245, 245, 1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/phychiatric.png', // Replace with the path to your image
                    height: 300.0,
                    width: 420.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: names.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, int index) => Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 55.0,
                                          height: 55.0,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.green,
                                            foregroundColor: Colors.green,
                                            backgroundImage: AssetImage('assets/images/profilepic.png'),
                                          ),
                                        ),
                                        SizedBox(width: 10.0), // Adjust the width as needed
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 5.0),
                                            Text(
                                              names[index],
                                              style: TextStyle(
                                                  color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18.0),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      child: IconButton(
                                        icon: Icon(Icons.message, color: Color.fromARGB(255, 202, 81, 81)), // WhatsApp icon
                                        onPressed: () {
                                          // Handle WhatsApp action
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
           
     // ... (other code)

// ... (other code)

Container(
  color: Color.fromRGBO(245, 245, 245, 1.0),
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 500,
          child: Image.asset(
            'assets/images/mental.jpg',
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0), // Adjust the horizontal padding as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guidance',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                'Psychiatrists play a vital role in aiding domestic violence victims by providing specialized mental health care. Through therapeutic methods like cognitive-behavioral therapy and trauma-focused interventions, they address the psychological impact of abuse, collaborating with other professionals to create personalized treatment plans. With empathy and compassion, psychiatrists assist survivors in rebuilding self-worth, managing trauma symptoms, and developing coping mechanisms. They may also prescribe medications when necessary, contributing significantly to the holistic recovery of victims and empowering them to regain control over their lives.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),

            // Section 3 Placeholder
            Container(
               color: Color.fromRGBO(245, 245, 245, 1.0),
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child:SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FAQItem(
          question: 'How do psychiatrists assist victims of domestic violence?',
          answer:
              'Psychiatrists support victims through specialized mental health care, using therapeutic approaches like cognitive-behavioral therapy and trauma-focused interventions to address the psychological impact of abuse.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'What services do psychiatrists provide for domestic violence survivors?',
          answer:
              'Psychiatrists offer a range of services, including counseling, trauma management, and personalized treatment plans to help survivors navigate the emotional aftermath of domestic violence.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'Do psychiatrists collaborate with other professionals in the field?',
          answer:
              'Yes, psychiatrists collaborate with healthcare professionals, social workers, and support networks to create comprehensive treatment plans tailored to the unique needs of domestic violence survivors.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'How can psychiatrists help in rebuilding self-worth and resilience?',
          answer:
              'Through compassionate and empathetic approaches, psychiatrists assist victims in rebuilding their sense of self-worth, managing trauma-related symptoms, and developing coping mechanisms for long-term mental well-being.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'Do psychiatrists prescribe medications to address mental health issues?',
          answer:
              'Yes, psychiatrists may prescribe medications to address issues like anxiety, depression, or post-traumatic stress disorder that often accompany experiences of domestic violence.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'Are the services of psychiatrists confidential?',
          answer:
              'Yes, confidentiality is a priority, and psychiatrists take measures to ensure the privacy and safety of individuals seeking mental health support for domestic violence.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'How do psychiatrists contribute to the overall recovery and empowerment of survivors?',
          answer:
              'Psychiatrists play a crucial role in the holistic recovery of survivors by fostering resilience, empowering them to regain control over their lives, and providing the necessary mental health tools for a fresh start.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
      ],
    ),
  ),
  ),
  
),
          ],
        ),
      ),
    );
  }
}
class FAQItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final ValueChanged<bool>? onExpansionChanged;

  const FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
    this.onExpansionChanged,
  });

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Text(
                widget.answer,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
        initiallyExpanded: widget.isExpanded,
        onExpansionChanged: widget.onExpansionChanged,
      ),
    );
  }
}
