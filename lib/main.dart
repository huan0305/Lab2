import 'package:flutter/material.dart';
import 'package:lab2/ToDoDatabase.dart';

import 'ToDoDAO.dart';
import 'ToDoItem.dart';

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
      home: const MyHomePage(title: 'Lab 8'),
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
  // declared an array of ToDoItems
  var listObjects = <ToDoItem>[];
  // declared a DAO.
  late ToDoDAO myDAO;

  // lab 8 declaration
  ToDoItem? selectedItem = null;

  @override
  void initState() {
    super.initState();

    // Initializing database
    $FloorToDoDatabase.databaseBuilder('app_database.db').build().then((database) {
      myDAO = database.getDao;

      // getting all items from database and storing in listObjects array.
      myDAO.getAllItems().then ((listOfItems){
        setState(() {
          listObjects.addAll(listOfItems);
        });
      });
    });
    _controller = TextEditingController();
  }

  @override
  void dispose() {
  _controller.dispose();
  super.dispose();
  }

  Widget ToDoList() {
    return Center(
      child: Column(
        children: [
          // ADD ROW
          Row(
            children: [
              ElevatedButton(
                child: Text("Add"),
                onPressed: () {
                  var userTyped = _controller.value.text;
                  // setting state of GUI
                  setState(() {
                    var newItem = ToDoItem(ToDoItem.ID, userTyped);
                    // adding new ToDoItem to database
                    listObjects.add(newItem);
                    myDAO.insertItem(newItem);
                    _controller.text = "";
                  });
                },
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Type Here",
                    border: OutlineInputBorder(),
                    labelText: "Enter a todo item",
                  ),
                ),
              ),
            ],
          ),

          // ITEM LIST
          // If the list is empty, it notifies the user.
          if (listObjects.isEmpty)
            Text("There are no items in the list.")
          else
            Expanded(
              child: ListView.builder(
                itemCount: listObjects.length,
                itemBuilder: (context, rowNumber) {
                  return GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Row number: $rowNumber"),
                        Text(listObjects[rowNumber].message),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        selectedItem = listObjects[rowNumber];
                      });
                    },
                    // Alert dialog launched on long press of row
                    onLongPress: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Delete Item'),
                          content: const Text('Do you want to delete the item?'),
                          actions: <Widget>[
                            // Yes button deletes object and closes alert dialog
                            ElevatedButton(
                              child: Text("Yes"),
                              onPressed: () {
                                setState(() {
                                  var itm = listObjects[rowNumber];
                                  // deletes item from database
                                  myDAO.deleteItem(itm);
                                  // removes from listObjects array
                                  listObjects.removeAt(rowNumber);
                                  Navigator.pop(context);
                                });
                              },
                            ),
                            // No button closes alert dialog only
                            OutlinedButton(
                              child: Text("No"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget DetailsPage() {
    if (selectedItem == null)
      return Center(
        child: Text("Nothing is selected.", textAlign: TextAlign.center),
      );
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Database ID: ${selectedItem!.id}', // ! for not null
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              'Message: ${selectedItem!.message}',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  var itm = selectedItem;
                  // deletes item from database
                  if (itm != null) {
                    myDAO.deleteItem(itm);
                    // removes from listObjects array
                    listObjects.remove(itm);
                    selectedItem = null;
                  }
                });
              },
              child: Text("Delete"),
            ),
          ],
        ),
      );
    }
  }


  Widget responsiveLayout() {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    if ((width > height) && (width > 720)) { // landscape mode
      return Row(children: [
        Expanded(flex: 1, child: ToDoList()),
        Expanded(flex: 2, child: DetailsPage())
      ]);
    } else {
      if (selectedItem == null)
        return ToDoList();
      else
        return DetailsPage();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: responsiveLayout()


    );
  }
}
