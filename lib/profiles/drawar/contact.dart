// ignore_for_file: prefer_const_constructors, avoid_print, library_private_types_in_public_api

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

      // Prepare the data to be sent in the request body
      Map<String, dynamic> data = {
        'firstName': firstName,
        'lastName': lastName,
        'email':email,
        'subject': subject,
        'message': message,
      };

      // Send data to backend server
      final response = await http.post(
        Uri.parse(
            'http://13.51.241.148:5000/contacts'), // Replace with your backend API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Data successfully stored in the database
        // You can handle the success case here (e.g., show a success message)
        debugPrint('Contact form data submitted successfully');
      } else {
        // Error occurred while storing data in the database
        // You can handle the error case here (e.g., show an error message)
        debugPrint(
            'Failed to submit contact form data: ${response.reasonPhrase}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) => validateField(value, 'First Name'),
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) => validateField(value, 'Last Name'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) => validateField(value, 'Email'),
                ),
                TextFormField(
                  controller: subjectController,
                  decoration: InputDecoration(labelText: 'Subject'),
                  validator: (value) => validateField(value, 'Subject'),
                ),
                TextFormField(
                  controller: messageController,
                  maxLines: null,
                  decoration: InputDecoration(labelText: 'Message'),
                  validator: (value) => validateField(value, 'Message'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Send Message'),
                ),
              ],
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
