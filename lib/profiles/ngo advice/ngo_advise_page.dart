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
      home: ngoAdvicePage(),
    );
  }
}

class ngoAdvicePage extends StatelessWidget {
  List names = ["member1", "member2", "member3", "member4", "member5"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1, // Set the initial index to Lawyer List
      child: Scaffold(
        appBar: AppBar(
          title: Text('NGO Advise'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'NGOs List'),
              Tab(text: 'mission'),
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
                    'assets/images/download.png', // Replace with the path to your image
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
            'assets/images/NGO12.png',
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
                'Our Mission',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                'our mission is to empower and support survivors of domestic violence. We are dedicated to creating a safe and nurturing environment where victims can find refuge, resources, and the assistance they need to break free from the cycle of abuse. Through advocacy, education, and direct intervention, we strive to raise awareness about domestic violence, provide comprehensive support services, and work towards a society where everyone can live free from the fear of harm. Together, we are committed to breaking the silence, fostering resilience, and building a community where survivors can reclaim their lives with dignity and strength.',
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
          question: 'How can the NGO help me if I am a victim of domestic violence?',
          answer:
              'Our NGO offers a range of support services, including access to safe shelters, counseling, legal assistance, and resources to help you navigate through the challenges of domestic violence. We are committed to providing a comprehensive and personalized approach to support your unique needs.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'Is the assistance provided by the NGO confidential?',
          answer:
              ' Yes, confidentiality is a top priority. We understand the sensitivity of domestic violence situations, and our team takes every measure to ensure your privacy and safety. Our services are provided in a secure and confidential environment.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'How can I reach out to the NGO for immediate help?',
          answer:
              ' If you are in immediate danger, please call emergency services. To reach our NGO, you can contact our 24/7 helpline at [Helpline Number]. Our trained professionals are ready to assist you, provide guidance, and connect you with the necessary resources.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: ' Does the NGO provide legal assistance for domestic violence cases?',
          answer:
              'Yes, our NGO collaborates with legal experts to offer assistance in domestic violence cases. We can help you understand your legal rights, guide you through the legal process, and connect you with experienced attorneys who specialize in domestic violence cases.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'What resources does the NGO offer to help survivors rebuild their lives?',
          answer:
              'We provide a range of resources, including job training, educational support, and counseling services to help survivors rebuild their lives after leaving an abusive situation. Our goal is to empower survivors with the tools and skills they need for a fresh start.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'Is the NGO involved in community education and awareness programs?',
          answer:
              'Absolutely. We actively engage in community outreach programs to raise awareness about domestic violence, its impact, and the resources available for those in need. Education is a key component of our mission to prevent and address domestic violence.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'Can friends or family members refer someone to the NGO for assistance?',
          answer:
              'Yes, friends, family members, or concerned individuals can refer someone to our NGO for assistance. We encourage anyone who knows someone experiencing domestic violence to reach out to us. We are here to provide support and guidance to those in need.',
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
