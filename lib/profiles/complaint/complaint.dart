// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_declarations, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  File? _selectedImage;

  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  Future<void> _uploadImage() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final url = 'http://13.51.241.148:5000/form/complaints/';
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(http.MultipartFile(
        'image',
        _selectedImage!.readAsBytes().asStream(),
        _selectedImage!.lengthSync(),
        filename: 'image.jpg',
      ));
      request.fields.addAll({
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'address': addressController.text,
      });

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      // Handle the response as needed
      debugPrint('Response Code: ${response.statusCode}');
      debugPrint('Response Body: $responseBody');

      if (response.statusCode == 201) {
        // Display success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Complaint registered successfully!'),
            duration: Duration(seconds: 2),
          ),
        );

        // Reset input fields
        nameController.clear();
        emailController.clear();
        phoneController.clear();
        addressController.clear();
        setState(() {
          _selectedImage = null;
        });
      } else {
        // Display error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('An error occurred while registering your complaint.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error uploading image and sending data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit a Complaint'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    'Register your Complaint',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  prefixIcon: Icon(Icons.home),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await _pickImage();
                },
                child: Text('Pick Image'),
              ),
              SizedBox(height: 16),
              if (_selectedImage != null)
                Column(
                  children: [
                    Image.file(_selectedImage!, height: 200, width: 200),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _removeImage,
                      child: Text('Remove Image'),
                    ),
                  ],
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await _uploadImage();
                },
                child: Text('Submit Complaint'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
