// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:mehfooz_aashiyana1/views/homepage.dart';

// import 'loginpage.dart';
import 'loginpage.dart';
import '../main_profile.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('./assets/images/logo.png', width: 175, height: 175),
            SizedBox(height: 45),
            Text(
              "MEHFOOZ AASHIYANA",
              style: TextStyle(
                color: Color.fromARGB(255, 103, 98, 98),
                fontSize: 28,
                fontFamily: 'minimal sans-serif',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),
            InkWell(
              onTap: () {
                // debugPrint("Login");
                // Navigate to the login page here if needed
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 55,
                width: 300, // Adjust the width as needed
                decoration: BoxDecoration(
                  color: Color.fromRGBO(106, 127, 247, 1),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            InkWell(
              onTap: () {
                // debugPrint("Guest Mode");

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(106, 127, 247, 1),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Text(
                  'Guest Mode',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
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
