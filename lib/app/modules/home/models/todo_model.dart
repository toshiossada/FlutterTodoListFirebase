import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  bool check;
  DocumentReference reference;
  int position;
  int id;

  TodoModel(
      {this.title = '',
      this.check = false,
      this.reference,
      this.id,
      this.position});

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
      check: doc['check'],
      title: doc['title'],
      reference: doc.reference,
      position: doc['position'],
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        check: json['check'], title: json['title'], id: json['id']);
  }

  Map<String, dynamic> toJson() => {};
}
