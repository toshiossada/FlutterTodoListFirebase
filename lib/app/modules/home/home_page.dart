import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'models/todo_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.todoList.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.todoList.hasError) {
          return Center(
            child: RaisedButton(
              onPressed: controller.getList,
              child: Text('Error'),
            ),
          );
        } else {
          List<TodoModel> list = controller.todoList.data;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                var model = list[index];
                return ListTile(
                  onTap: () {
                    _showDialog(model: model);
                  },
                  title: Text(model.title),
                  leading: IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      controller.delete(model);
                    },
                  ),
                  trailing: Checkbox(
                    value: model.check,
                    onChanged: (v) {
                      model.check = v;
                      controller.save(model);
                    },
                  ),
                );
              });
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  _showDialog({TodoModel model}) {
    model ??= TodoModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(model.reference == null ? 'Adicionar' : 'Alterar'),
            content: TextFormField(
              initialValue: model.title,
              onChanged: (v) => model.title = v,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'escreva...',
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  controller.save(model);
                  Modular.to.pop();
                },
                child: Text('Adicionar'),
              ),
            ],
          );
        });
  }
}
