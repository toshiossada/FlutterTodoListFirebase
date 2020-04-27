import '../../models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> get();
  Future save(TodoModel model);
  Future delete(TodoModel model);
  Future<Stream<TodoModel>> getByDocumentId(String documentId);
}
