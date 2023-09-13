import 'package:flutter/material.dart';
import 'package:tasks_basic/checklist/model/beeceptor_service.dart';
import 'package:tasks_basic/checklist/model/task_dto.dart';

class ChecklistStore extends ChangeNotifier {
  final BeeceptorService _beeceptorService = BeeceptorService();

  final _taskList = <TaskDTO>[];
  var _error = '';
  var _isLoading = true;

  List<TaskDTO> get taskList => _taskList;
  String get error => _error;
  bool get isLoading => _isLoading;

  void getTaskList() async {
    try {
      await _beeceptorService
          .getTaskList()
          .then((value) => _taskList.addAll(value));
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
