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
      home: const MyHomePage(title: 'Lab 6'),
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

  late TextEditingController _controller;
  List<String> listObjects = [];


  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
  _controller.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          //ADD ROW
          Row(children: [
            ElevatedButton(child: Text("Add"), onPressed: () {
              var userTyped = _controller.value.text;
              //setting state of GUI
              setState(() {
                listObjects.add(userTyped);
                _controller.text = "";
              });
            }),

            Expanded(child:
              TextField(controller: _controller,
                decoration: InputDecoration(
                  hintText: "Type Here",
                  border: OutlineInputBorder(),
                  labelText: "Enter a todo item"
                ),
              )
            )
          ]),

          //ITEM LIST
          // If the list is empty, it notifies the user.
          if(listObjects.isEmpty)
            Text("There are no items in the list.")
          else
          Expanded( child:
              ListView.builder(
                itemCount: listObjects.length,
                itemBuilder: (context, rowNumber) {
                  return
                      GestureDetector(child:
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Row number: ${rowNumber}"),
                              Text(listObjects[rowNumber]),
                        ]),
                        //Alert dialog launched on long press of row.
                        onLongPress: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Delete Item'),
                              content: const Text('Do you want to delete the item?'),
                              actions: <Widget>[
                                //Yes button deletes object and closes alert dialog.
                                ElevatedButton(child: Text("Yes"), onPressed: () {
                                  setState(() {
                                    listObjects.removeAt(rowNumber);
                                    Navigator.pop(context);
                                  });
                                }),
                                //No button closes alert dialog only.
                                OutlinedButton(child: Text("No"), onPressed: () {
                                  Navigator.pop(context);
                                })
                              ],
                            ),
                          );
                        },
                      );
                },
              )
          )
      ]),
    ));
  }
}
