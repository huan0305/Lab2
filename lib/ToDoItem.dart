
import 'package:floor/floor.dart';

@entity // makes variable names as column names.
class ToDoItem {

  static int ID = 1;

  @primaryKey // unique ID numbers
  final int id;

  final String message;

  ToDoItem(this.id, this.message) {
    if(id >= ID) // from database
      ID = id + 1; // ID will always be 1 more than biggest db id
  }
}