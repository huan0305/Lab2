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

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/beef.jpg"),
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "BEEF",
                            style: TextStyle(
                            color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                          ),
                        ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/chicken.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                            "CHICKEN",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/pork.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                            "PORK",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/seafood.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                            "SEAFOOD",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
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
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/maindish.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Text(
                            "MAIN DISHES",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/salad.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Text(
                            "SALADS",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/sidedish.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Text(
                            "SIDE DISHES",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/crockpot.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Text(
                            "CROCKPOT",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
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
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/icecream.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                            "ICE CREAM",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/brownies.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                            "BROWNIES",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/pies.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                            "PIES",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/cookies.jpg"),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                            "COOKIES",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
