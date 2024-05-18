// ignore_for_file: prefer_const_constructors

import 'package:first_app/profiles/welcome/welcome.dart';
import 'package:first_app/profiles/main_profile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(MaterialApp(
      title: 'Mehfooz Aashiyana',
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.resize(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.resize(1200, name: '4K'),
        ],
      ),
      home: Welcome(),
      routes: {
        '/profile': (context) => ProfileScreen(),
      },
    ));
