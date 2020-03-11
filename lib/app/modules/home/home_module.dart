import 'package:todo_firebase/app/modules/home/services/todo_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/app/modules/home/repositories/todo_repository.dart';
import 'package:todo_firebase/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/home/home_page.dart';

import 'repositories/interfaces/todo_repository_interface.dart';
import 'services/interfaces/todo_service_interfaces.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ITodoService>((i) => TodoService(todoRepoitory: i.get())),
        Bind<ITodoRepository>(
            (i) => TodoRepository(firestore: Firestore.instance)),
        Bind((i) => HomeController(todoService: i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
