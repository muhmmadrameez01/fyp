// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unnecessary_import, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName can't be empty";
    }
    return null;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String firstName = firstNameController.text;
      String lastName = lastNameController.text;
      String email = emailController.text;
      String subject = subjectController.text;
      String message = messageController.text;

      Map<String, dynamic> data = {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'subject': subject,
        'message': message,
      };

      final response = await http.post(
        Uri.parse('http://13.51.241.148:5000/contacts'), // Replace with your backend API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        debugPrint('Contact form data submitted successfully');
      } else {
        debugPrint('Failed to submit contact form data: ${response.reasonPhrase}');
      }
    }
  }

  InputDecoration inputDecoration(String labelText, {IconData? icon}) {
    return InputDecoration(
      hintText: labelText,
      hintStyle: TextStyle(color: Colors.white),
      prefixIcon: icon != null
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(icon, color: Colors.white, size: 20),
            )
          : null,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000428), Color(0xFF004e92)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 60), // Adjust this to move "Contact Us" down
                  Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 40), // Space between title and form
                  Container(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            controller: firstNameController,
                            style: TextStyle(color: Colors.white),
                            decoration: inputDecoration('First Name', icon: Icons.person),
                            validator: (value) => validateField(value, 'First Name'),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: lastNameController,
                            style: TextStyle(color: Colors.white),
                            decoration: inputDecoration('Last Name', icon: Icons.person_outline),
                            validator: (value) => validateField(value, 'Last Name'),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: inputDecoration('Email', icon: Icons.email),
                            validator: (value) => validateField(value, 'Email'),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: subjectController,
                            style: TextStyle(color: Colors.white),
                            decoration: inputDecoration('Subject', icon: Icons.subject),
                            validator: (value) => validateField(value, 'Subject'),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: messageController,
                            minLines: 5,
                            maxLines: null,
                            style: TextStyle(color: Colors.white),
                            decoration: inputDecoration('Message'),
                            validator: (value) => validateField(value, 'Message'),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: _submitForm,
                            child: Text('Send Message'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20), // Space at the bottom
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ContactPage(),
  ));
}
