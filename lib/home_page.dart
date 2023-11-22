import 'package:flutter/material.dart';
import 'package:todo_flutter/data/data.dart';
import 'package:todo_flutter/helpers/dialog_box.dart';
import 'helpers/todo_cell.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoData toDoData = ToDoData();
  final _controller = TextEditingController();

  @override
  void initState() {
    if (toDoData.hasData()) {
      toDoData.loadData();
    } else {
      toDoData.initData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: const Text("My Todo"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
      body: toDoData.tasks.isEmpty
          ? Center(child: Text("Good job! No tasks were found"))
          : ListView.builder(
              itemCount: toDoData.tasks.length,
              itemBuilder: (context, index) {
                return ToDoCell(
                  name: toDoData.tasks[index][0],
                  isCompleted: toDoData.tasks[index][1],
                  onChanged: (value) => onCheckboxChanged(value, index),
                  onDelete: (context) => deleteTask(index),
                );
              },
            ),
    );
  }

  void onCheckboxChanged(bool? value, int index) {
    setState(() {
      toDoData.tasks[index][1] = !toDoData.tasks[index][1];
    });
    toDoData.updateData();
  }

  void saveTask() {
    setState(() {
      toDoData.tasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    toDoData.updateData();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      toDoData.tasks.removeAt(index);
    });
    toDoData.updateData();
  }
}
