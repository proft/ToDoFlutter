import 'package:hive_flutter/hive_flutter.dart';

class ToDoData {
  final _box = Hive.box("ToDo");

  List tasks = [];

  void initData() {
    tasks = [
      ["My first task", false],
    ];
  }

  bool hasData() {
    return _box.get("ITEMS") != null;
  }

  void loadData() {
    tasks = _box.get("ITEMS");
  }

  void updateData() {
    _box.put("ITEMS", tasks);
  }
}
