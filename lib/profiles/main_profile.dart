// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, library_private_types_in_public_api, unused_import, avoid_print, use_key_in_widget_constructors, prefer_final_fields, unused_field, sort_child_properties_last
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_app/profiles/about%20us/aboutinfo.dart';
import 'package:first_app/profiles/about%20us/faq_bttom.dart';
import 'package:first_app/profiles/drawar/account_setting.dart';
import 'package:first_app/profiles/drawar/contact.dart';
import 'package:first_app/profiles/drawar/counselling.dart';
import 'package:first_app/profiles/drawar/edit_profile.dart';
import 'package:first_app/profiles/feedback/reference.dart';
import 'package:first_app/profiles/legal%20adcice/legal_advise_page.dart';
import 'package:flutter/material.dart';

import 'complaint/complaint.dart';
import 'feedback/feedback_page.dart';
import 'help and support/help_and_support.dart';
//import 'legal adcice/legal_advice_page.dart';

import 'ngo advice/ngo_advise_page.dart';
import 'physiatrist advice/psychiatric_advice_page.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 0;
  int _selectedPage = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> catNames = [
    "Legal Advise",
    "NGOs Advise",
    "physiatrist Advise",
    "Counselling",
    "Danger Area",
    "Chatbot",
  ];

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7F7F),
    Color.fromARGB(255, 161, 17, 29),
    Color(0xFF78E667),
  ];

  List<IconData> catIcons = [
    Icons.gavel,
    Icons.volunteer_activism,
    Icons.healing,
    Icons.chat_bubble,
    Icons.dangerous,
    Icons.forum,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
              color: Color.fromRGBO(106, 127, 247, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 1),
                Padding(
                  padding: EdgeInsets.only(left: 2, bottom: 100),
                  child: Row(
                    children: [
                      Text(
                        "Mehfooz Aashiyana",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.dashboard,
                          size: 24,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 130, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the corresponding page based on the index.
                        switch (index) {
                          case 0:
                            // Legal Advise
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LegalAdvicePage()));
                            break;
                          case 1:
                            //  NGOs Advise
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ngoAdvicePage()));
                            break;
                          case 2:
                            // physiatrist Advise
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PhysiatristAdvicePage()));
                            break;
                          case 3:
                            // Counselling
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CounselingPage()));
                            break;
                          case 4:
                            // Danger Area
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => DangerAreaPage()));
                            break;
                          case 5:
                            // Chatbot
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatbotPage()));
                            break;
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                catIcons[index],
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            catNames[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/domestic background.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      UserAccountsDrawerHeader(
                        accountName: Text("Babar Azam"),
                        accountEmail: Text(
                            "Babar56@gmail.com"), // You can add an email here if needed.
                        currentAccountPicture: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profilepic.png'),
                        ),
                        decoration: BoxDecoration(
                          color: Colors
                              .transparent, // Make the header background transparent
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: _currentIndex == 1 ? Colors.black : Colors.grey,
                    ),
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    tileColor: _currentIndex == 1 ? Colors.grey : null,
                    onTap: () {
                      setState(() {
                        _currentIndex = 1; // Update the selected index
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.help_center,
                      color: _currentIndex == 2 ? Colors.black : Colors.grey,
                    ),
                    title: Text(
                      'Help and Support',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    tileColor: _currentIndex == 2 ? Colors.grey : null,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HelpAndSupportPage()));
                      setState(() {
                        _currentIndex = 2; // Update the selected index
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.password,
                      color: _currentIndex == 3 ? Colors.black : Colors.grey,
                    ),
                    title: Text(
                      'Change Password',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    tileColor: _currentIndex == 3 ? Colors.grey : null,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountSettingsPage()));
                      setState(() {
                        _currentIndex = 3; // Update the selected index
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.feedback,
                      color: _currentIndex == 4 ? Colors.black : Colors.grey,
                    ),
                    title: Text(
                      'Feedback and Support',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    tileColor: _currentIndex == 4 ? Colors.grey : null,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedbackPage()));
                      setState(() {
                        _currentIndex = 4; // Update the selected index
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.report,
                      color: _currentIndex == 5 ? Colors.black : Colors.grey,
                    ),
                    title: Text(
                      'Report Case',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    tileColor: _currentIndex == 5 ? Colors.grey : null,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComplaintPage()));
                      setState(() {
                        _currentIndex = 5; // Update the selected index
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.contact_mail,
                      color: _currentIndex == 6 ? Colors.black : Colors.grey,
                    ),
                    title: Text(
                      ' Contact',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    tileColor: _currentIndex == 6 ? Colors.grey : null,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactPage()));
                      setState(() {
                        _currentIndex = 6; // Update the selected index
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.description,
                      color: _currentIndex == 7 ? Colors.black : Colors.grey,
                    ),
                    title: Text(
                      'Reference',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    tileColor: _currentIndex == 7 ? Colors.grey : null,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProjectReferencePage()));
                      setState(() {
                        _currentIndex = 7; // Update the selected index
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: _currentIndex == 8 ? Colors.black : Colors.grey,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    tileColor: _currentIndex == 8 ? Colors.grey : null,
                    onTap: () {
                      setState(() {
                        _currentIndex = 8; // Update the selected index
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromRGBO(106, 127, 247, 1),
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ));
          } else {
            print(index);
          }
          if (index == 1) {
            // Check if the "info_sharp" icon is tapped (index 1).
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => InformationPage(),
            ));
          } else {
            print(index);
          }
          if (index == 2) {
            // Check if the "FAQ" icon is tapped (index 2).
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FAQPage(),
            ));
          }
          if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ComplaintPage(),
            ));
          } else {
            print(index);
          }
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.info_sharp,
            color: Colors.white,
          ),
          Icon(
            Icons.message,
            color: Colors.white,
          ),
          Icon(
            Icons.report,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
