// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _verifyPasswordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }

  String? _validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "New password can't be empty";
    }
    return null;
  }

  String? _validateVerifyPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Verify password can't be empty";
    }
    if (value != _newPasswordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  width: 370,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 24.0),
                    ),
                    validator: _validateEmail,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Container(
                  width: 370,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 24.0),
                    ),
                    validator: _validateNewPassword,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Container(
                  width: 370,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: _verifyPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Verify Password',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 24.0),
                    ),
                    validator: _validateVerifyPassword,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, you can proceed with password reset
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(106, 127, 247, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ForgotPasswordPage(),
  ));
}
