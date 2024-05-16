// ignore_for_file: prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class AccountSettingsPage extends StatefulWidget {
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }

  String? _validateOldPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Old password can't be empty";
    }
    return null;
  }

  String? _validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "New password can't be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
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
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'email',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 24.0),
                    ),
                    validator: _validateUsername,
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
                    controller: _oldPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Old Password',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 24.0),
                    ),
                    validator: _validateOldPassword,
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
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, you can proceed with saving the account settings
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
                      'Save password',
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
    home: AccountSettingsPage(),
  ));
}
