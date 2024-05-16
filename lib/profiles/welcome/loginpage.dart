// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';

import 'network_handler.dart';
import 'forgetpassword.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool vis = true;
  final gobalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String errorText = "";
  bool validate = false;
  bool circular = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child: Form(
              key: gobalkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset('./assets/images/logo.png',
                        width: 140, height: 140),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Text(
                        'Login to your account',
                        style: TextStyle(
                          color: Color.fromARGB(255, 103, 98, 98),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            errorText: validate ? null : errorText,
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 24.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: vis,
                          decoration: InputDecoration(
                            errorText: validate ? null : errorText,
                            suffixIcon: IconButton(
                              icon: Icon(vis
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  vis = !vis;
                                });
                              },
                            ),
                            hintText: 'Password',
                            border: OutlineInputBorder(),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 24.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            validate = true;
                          });
                          Map<String, String> data = {
                            "email": emailcontroller.text,
                            "password": passwordcontroller.text,
                          };
                          debugPrint("$data");
                          var response =
                              await networkHandler.post("/user/login", data);

                          if (response.statusCode == 200 ||
                              response.statusCode == 201) {
                            Map<String, dynamic> output =
                                json.decode(response.body);
                            debugPrint(output['token']);
                            setState(() {
                              validate = true;
                              circular = false;
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(context, '/profile');
                          } else {
                            // String output = json.decode(response.body);
                            setState(() {
                              validate = false;
                              errorText =
                                  "Either email and password is incorrect";
                              circular = false;
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(106, 127, 247, 1),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 7,
                                )
                              ]),
                          child: Center(
                              child: circular
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const Signup();
                                  },
                                ),
                              );
                            },
                            child: const Text("Signup"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ForgotPasswordPage();
                                  },
                                ),
                              );
                            },
                            child: const Text("Forget Password"),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
