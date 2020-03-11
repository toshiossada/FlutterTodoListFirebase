import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/home/models/todo_model.dart';
import 'package:todo_firebase/app/modules/home/repositories/interfaces/todo_repository_interface.dart';

import 'interfaces/todo_service_interfaces.dart';

class TodoService extends Disposable implements ITodoService {
  //dispose will be called automatically
  @override
  void dispose() {}

  final ITodoRepository todoRepoitory;
  TodoService({@required this.todoRepoitory});

  @override
  Future delete(TodoModel model) {
    return todoRepoitory.delete(model);
  }

  @override
  Stream<List<TodoModel>> get() {
    return todoRepoitory.get();
  }

  @override
  Future save(TodoModel model) {
    return todoRepoitory.save(model);
  }
}
