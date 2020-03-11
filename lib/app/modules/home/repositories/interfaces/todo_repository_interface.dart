import 'package:todo_firebase/app/modules/home/models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> get();
  Future save(TodoModel model);
  Future delete(TodoModel model);
}
