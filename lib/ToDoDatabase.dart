
// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'ToDoDAO.dart';
import 'ToDoItem.dart';

// this has to match the database class name
part 'ToDoDatabase.g.dart'; // the generated code will be there

// anytime you change anything in the entity, you have to update the version number.
@Database(version: 1, entities: [ToDoItem])
abstract class ToDoDatabase extends FloorDatabase {
  // get interface to database
  ToDoDAO get getDao; // one function for giving access to insert, delete, update, query.
}