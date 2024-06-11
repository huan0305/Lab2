import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';

// Notes: may need 4-5 functions, 1 for save, load, clear, store, (possible 1 more)
// Prof said use encrypted for this lab, should not use shared.
// Shared preferences can see file, encrypted cannot.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lab 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void logIn() {

  }
  var imageSource = "images/question-mark.png";

  late TextEditingController _loginController;
  late TextEditingController _passwordController;

  // Lab 4 - declaring EncryptedSharedPreferences variable.
  late EncryptedSharedPreferences storedData;

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();

    // Lab 4 - Instantiating EncryptedSharedPreferences object.
    storedData = EncryptedSharedPreferences();

    // Lab 4 - Retrieving values for UserName and Password and autofilling them.
    storedData.getString("UserName").then((storedUserName) {
      if (storedUserName != null) {
        _loginController.text = storedUserName;
      }

      // Check after setting the user name
      if (_loginController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        // Snackbar loads if login and password are not empty.
        var snackBar = SnackBar(
            content: Text('Previous login name and password loaded.'),
            // Snackbar button clears data from EncryptedSharedPreferences.
            action: SnackBarAction(label: "Clear saved data",
              onPressed: () {
                storedData.remove("UserName");
                storedData.remove("Password");
                // Resets fields to empty string.
                _loginController.text = "";
                _passwordController.text = "";
              },
            )
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    storedData.getString("Password").then((storedPassword) {
      if (storedPassword != null) {
        _passwordController.text = storedPassword;
      }
    });
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void buttonClicked() {
    setState( () {
      if (_passwordController.text == "QWERTY123") {
        imageSource = "images/idea.png";
      } else {
        imageSource = "images/stop.png";
      }
    });
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            title: const Text('Login'),
            content: const Text('Would you like to save your username and password?'),
            actions: <Widget>[
              ElevatedButton(child: Text("Save"),
                  onPressed: () {
                    var userName = _loginController.value.text;
                    var userPassword = _passwordController.value.text;

                    // Lab 4 - Storing username and password in encrypted shared preferences.
                    storedData.setString("UserName", userName);
                    storedData.setString("Password", userPassword);

                    Navigator.pop(context);
                  }
                  ),
              FilledButton(child: Text("Cancel"),
                onPressed: () {
                  storedData.remove("UserName");
                  storedData.remove("Password");
                  // Resets fields to empty string.
                  _loginController.text = "";
                  _passwordController.text = "";
                  Navigator.pop(context);
                },
                )
            ],
          )
    );
  }


  // This is the page layout.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: _loginController,
                decoration: InputDecoration(
                    hintText:"Type here",
                    border: OutlineInputBorder(),
                    labelText: "Login"
                )),
            TextField(controller: _passwordController,
              decoration: InputDecoration(
                  hintText:"Type here",
                  border: OutlineInputBorder(),
                  labelText: "Password"
              ),
              obscureText:true,
            ),

            ElevatedButton(
                child: Text("Login"),
                onPressed: buttonClicked

            ),
            Image.asset(imageSource, width: 300, height: 300)
          ],
        ),
      ),
    );
  }
}
