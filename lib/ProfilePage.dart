

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'DataRepository.dart';
import 'main.dart';

// Lab 5 - second page to navigate to with textfields to insert information.
class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  late TextEditingController _controllerFName;
  late TextEditingController _controllerLName;
  late TextEditingController _controllerPhone;
  late TextEditingController _controllerEmail;

  @override
  void initState() {
    super.initState();
    _controllerFName = TextEditingController();
    _controllerLName = TextEditingController();
    _controllerPhone = TextEditingController();
    _controllerEmail = TextEditingController();

    // Loading variables from data repository and setting to textfields.
    DataRepository.loadData().then((_) {
      setState(() {
        _controllerFName.text = DataRepository.firstName;
        _controllerLName.text = DataRepository.lastName;
        _controllerPhone.text = DataRepository.phoneNumber;
        _controllerEmail.text = DataRepository.email;
      });
    });

    // This loads the snackbar with login name from main page.
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Welcome back ' + DataRepository.getLogin()),
            duration: Duration(seconds: 5),
          )
        );
    });
  }

  @override
  void dispose() {
    DataRepository.firstName = _controllerFName.text;
    DataRepository.lastName = _controllerLName.text;
    DataRepository.phoneNumber = _controllerPhone.text;
    DataRepository.email = _controllerEmail.text;
    DataRepository.saveData();

    _controllerFName.dispose();
    _controllerLName.dispose();
    _controllerPhone.dispose();
    _controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                children: [
                  TextField(
                    controller: _controllerFName,
                    decoration: InputDecoration(
                      hintText: "First Name",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      DataRepository.firstName = value;
                    },
                  ),
                  SizedBox(height: 10), // spacing for between elements.
                  TextField(
                    controller: _controllerLName,
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row( // row with flexible textfield to allow icons to be inserted in line.
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          controller: _controllerPhone,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          canLaunch("tel:+1-888-123-4567").then(
                                (itCan) {
                              if (itCan) {
                                launch("tel:" + DataRepository.phoneNumber);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Device not supported."),
                                      content: const Text("Calling is not supported on this device."),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.sms),
                        onPressed: () {
                          canLaunch("sms:+1-888-123-4567").then(
                                (itCan) {
                              if (itCan) {
                                launch("sms:" + DataRepository.phoneNumber);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Device not supported."),
                                      content: const Text("SMS is not supported on this device."),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          controller: _controllerEmail,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {
                          canLaunch("mailto:" + DataRepository.email).then(
                                (itCan) {
                              if (itCan) {
                                launch("mailto:" + DataRepository.email);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Device not supported."),
                                      content: const Text("Email is not supported on this device."),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
