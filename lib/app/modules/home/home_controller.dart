import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import 'models/todo_model.dart';
import 'services/interfaces/todo_service_interfaces.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoService todoService;

  @observable
  ObservableStream<List<TodoModel>> todoList;

  _HomeControllerBase({@required this.todoService}) {
    getList();
  }

  @action
  void getList() {
    todoList = todoService.get().asObservable();
  }

  @action
  void save(TodoModel model) {
    todoService.save(model);
  }

  @action
  void delete(TodoModel model) {
    todoService.delete(model);
  }
}
