// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'network_handler.dart';
import 'loginpage.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {
  bool vis = true;
  final GlobalKey<FormState> gobalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isEmailTaken = false;
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
                    padding: const EdgeInsets.only(top: 100),
                    child: Image.asset('./assets/images/logo.png',
                        width: 140, height: 140),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Text(
                        'Register to your account',
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
                          controller: usernamecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Full Name can't be empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                            ),
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
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            errorText: validate ? null : errorText,
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                      if (isEmailTaken)
                        Text(
                          'This email is already registered.',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password can't be empty";
                            }
                            if (value.length < 6) {
                              return "Password length must be greater than 6";
                            }
                            return null;
                          },
                          obscureText: vis,
                          decoration: InputDecoration(
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
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            circular = true;
                          });
                          await checkemail();
                          if (gobalkey.currentState!.validate() && validate) {
                            // Check if the email is already taken

                            if (!isEmailTaken) {
                              // Email is not taken, proceed with registration
                              Map<String, String> data = {
                                "username": usernamecontroller.text,
                                "email": emailcontroller.text,
                                "password": passwordcontroller.text,
                              };

                              debugPrint("$data");

                              await networkHandler.post("/user/register", data);
                              setState(() {
                                circular = false;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginPage();
                                  },
                                ),
                              );
                            }
                          }
                          setState(() {
                            circular = false;
                          });
                        },
                        child: circular
                            ? CircularProgressIndicator()
                            : Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(106, 127, 247, 1),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Signup',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to check if the email is already taken
  checkemail() async {
    if (emailcontroller.text.isEmpty) {
      setState(() {
        validate = false;
        errorText = "Email can't be empty";
      });
    } else {
      var response =
          await networkHandler.get("/user/checkemail/${emailcontroller.text}");
      if (response['Status']) {
        setState(() {
          validate = false;
          errorText = "Email already taken";
        });
      } else {
        setState(() {
          validate = true;
        });
      }
    }
  }
}
