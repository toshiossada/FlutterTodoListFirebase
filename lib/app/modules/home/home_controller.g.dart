// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$todoListAtom = Atom(name: '_HomeControllerBase.todoList');

  @override
  ObservableStream<List<TodoModel>> get todoList {
    _$todoListAtom.context.enforceReadPolicy(_$todoListAtom);
    _$todoListAtom.reportObserved();
    return super.todoList;
  }

  @override
  set todoList(ObservableStream<List<TodoModel>> value) {
    _$todoListAtom.context.conditionallyRunInAction(() {
      super.todoList = value;
      _$todoListAtom.reportChanged();
    }, _$todoListAtom, name: '${_$todoListAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save(TodoModel model) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.save(model);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(TodoModel model) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.delete(model);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'todoList: ${todoList.toString()}';
    return '{$string}';
  }
}
