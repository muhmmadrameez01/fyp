// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_import, must_be_immutable, library_private_types_in_public_api, unnecessary_import, unused_element, sort_child_properties_last, override_on_non_overriding_member

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LegalAdvicePage(),
    );
  }
}

class LegalAdvicePage extends StatelessWidget {
  List names = ["Lawyer1", "Lawyer2", "Lawyer3", "lawyer4", "lawyer5"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1, // Set the initial index to Lawyer List
      child: Scaffold(
        appBar: AppBar(
          title: Text('Legal Advice'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Lawyer List'),
              Tab(text: 'Awareness'),
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
                    'assets/images/lawyer_pic.jpeg', // Replace with the path to your image
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
          width: double.infinity,
          child: Image.asset(
            'assets/images/aware1.jpeg',
            height: 300,
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
                'Legal Awareness',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                'Legal advice on domestic violence is crucial for individuals facing such issues. It is essential to know your rights and seek help from legal professionals. If you are experiencing domestic violence, consider reaching out to a lawyer for guidance and support. Understanding the legal aspects of your situation can empower you to take necessary actions and protect yourself. A knowledgeable attorney can provide insights into available legal remedies and help you navigate the legal system effectively. Seek legal advice promptly to address your concerns and safeguard your rights.',
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
          question: 'What is the role of a lawyer in domestic violence cases?',
          answer:
              'Lawyers play a crucial role in domestic violence cases by providing legal advice, representing clients in court, and helping them navigate the legal system. They can assist in obtaining restraining orders, filing charges against the abuser, and ensuring the victim\'s rights are protected. Lawyers also work towards securing justice for victims and holding perpetrators accountable for their actions.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'How can a lawyer help in obtaining a restraining order?',
          answer:
              'Obtaining a restraining order is a legal process that involves filing the necessary paperwork, presenting evidence of the domestic violence, and attending court hearings. A lawyer can guide individuals through this process, ensuring all legal requirements are met. They can also represent the victim in court, presenting a strong case for the issuance of a restraining order to protect them from further harm.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'What legal remedies are available for domestic violence victims?',
          answer:
              'Domestic violence victims have various legal remedies available, including obtaining restraining orders, filing criminal charges against the abuser, and seeking compensation through civil lawsuits. A lawyer can assess the individual case, explain the available options, and help victims choose the most appropriate legal path based on their circumstances.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'Can a lawyer help in child custody cases related to domestic violence?',
          answer:
              'Yes, a lawyer can provide assistance in child custody cases related to domestic violence. They can help gather evidence, present the case in court, and advocate for the safety and well-being of the child. The court will consider the best interests of the child when making custody decisions, and a lawyer can play a crucial role in ensuring a positive outcome.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'Is legal aid available for victims of domestic violence?',
          answer:
              'Yes, legal aid is often available for victims of domestic violence. Many organizations and law firms provide pro bono services or legal assistance at reduced rates for individuals facing domestic violence issues. Victims can reach out to local legal aid organizations or shelters to inquire about available legal support.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'What steps should be taken immediately if someone is a victim of domestic violence?',
          answer:
              'If someone is a victim of domestic violence, the immediate steps include ensuring their safety and seeking medical attention if necessary. It is crucial to contact law enforcement to report the incident and file a complaint. Additionally, reaching out to a lawyer or a domestic violence hotline can provide guidance on legal options and resources available for protection.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'Can a lawyer help in obtaining a protective order for the victim?',
          answer:
              'Yes, a lawyer can assist in obtaining a protective order, also known as a restraining order, for the victim. They can guide the victim through the legal process, help gather evidence of the domestic violence, and represent them in court. A protective order aims to restrict the abuser from contacting or approaching the victim, providing an additional layer of legal protection.',
          isExpanded: false,
          onExpansionChanged: (value) {
            // Handle expansion state change if needed
          },
        ),
        FAQItem(
          question: 'What role does evidence play in domestic violence cases?',
          answer:
              'Evidence plays a crucial role in domestic violence cases. It can include medical records, photographs, text messages, and witness statements. A lawyer can help the victim collect and present relevant evidence in court to support their case. Strong evidence strengthens the legal position and increases the likelihood of obtaining a favorable outcome.',
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
