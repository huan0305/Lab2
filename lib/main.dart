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

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void buttonClicked() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          ElevatedButton(onPressed: onPressed, child: child)
          ],

    ));
  }

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
              onPressed: buttonClicked
              //   setState( () {
              //     if (_passwordController.text == "QWERTY123") {
              //       imageSource = "images/idea.png";
              //     } else {
              //       imageSource = "images/stop.png";
              //     }
              //   });
              ,
              child: Text("Login"),
            ),
            Image.asset(imageSource, width: 300, height: 300)
          ],
        ),
      ),
    );
  }
}
