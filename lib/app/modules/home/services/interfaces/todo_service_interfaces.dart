import '../../models/todo_model.dart';

abstract class ITodoService {
  Stream<List<TodoModel>> get();
  Future save(TodoModel model);
  Future delete(TodoModel model);
}
