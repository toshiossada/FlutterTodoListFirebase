import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/modules/home/repositories/interfaces/todo_repository_interface.dart';

import 'models/todo_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoRepository todoRepository;

  @observable
  ObservableStream<List<TodoModel>> todoList;

  _HomeControllerBase({this.todoRepository}) {
    getList();
  }

  @action
  getList() {
    todoList = todoRepository.get().asObservable();
  }

  @action
  save(TodoModel model) {
    todoRepository.save(model);
  }

  @action
  delete(TodoModel model) {
    todoRepository.delete(model);
  }
}
