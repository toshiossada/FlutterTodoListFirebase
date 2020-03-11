import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/home/models/todo_model.dart';

import 'interfaces/todo_repository_interface.dart';

class TodoRepository extends Disposable implements ITodoRepository {
  final Firestore firestore;

  TodoRepository({this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Stream<List<TodoModel>> get() {
    return firestore.collection('todo').orderBy('position').snapshots().map(
        (query) =>
            query.documents.map((doc) => TodoModel.fromDocument(doc)).toList());
  }

  @override
  Future save(TodoModel model) async {
    int total = (await Firestore.instance.collection('todo').getDocuments())
        .documents
        .length;

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('todo').add({
        'title': model.title,
        'check': model.check,
        'position': total,
      });
    } else {
      model.reference.updateData({
        'title': model.title,
        'check': model.check,
      });
    }
  }

  Future delete(TodoModel model) {
    return model.reference.delete();
  }
}
