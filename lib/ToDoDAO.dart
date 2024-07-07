import 'package:floor/floor.dart';
import 'ToDoItem.dart';

@dao
abstract class ToDoDAO { // no function bodies

  @insert // make it an insert function to generate
  Future<void> insertItem(ToDoItem itm); // asynchronous, return a Future

  @delete // generate the deletion statement in code
  Future<int> deleteItem(ToDoItem itm);

  @Query('SELECT * FROM ToDoItem;')
  Future<List<ToDoItem>> getAllItems();

  @update
  Future<int> updateItem(ToDoItem itm); // update the table where id = itm.id
}