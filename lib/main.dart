// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

import 'package:first_app/profiles/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'profiles/main_profile.dart';

void main() => runApp(MaterialApp(
      title: 'Mehfooz Aashiyana',
      debugShowCheckedModeBanner: false,
      // home:ProfileScreen(),
      home: Welcome(),
      routes: {
        '/profile': (context) => ProfileScreen(),
      },
    ));
