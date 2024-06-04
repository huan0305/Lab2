import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Lab 3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
                'BROWSE CATEGORIES',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "Not sure about exactly which recipe you're looking for? Do a search, or dive into our most popular categories.",
                  style: TextStyle(
                      fontSize: 18
                  )
              ),
            ),

            Text(
              "BY MEAT",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/beef.jpg"),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/chicken.jpg"),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/pork.jpg"),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/seafood.jpg"),
                ),
              ],
            ),

            Text(
                "BY COURSE",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/maindish.jpg"),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/salad.jpg"),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/sidedish.jpg"),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/crockpot.jpg"),
                ),
              ],
            ),

            Text(
                "BY DESSERT",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/icecream.jpg"),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/brownies.jpg"),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/pies.jpg"),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/cookies.jpg"),
                ),
              ],
            ),




          ],
        ),
      ),
    );
  }
}
