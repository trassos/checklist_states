import 'package:flutter/material.dart';
import 'package:tasks_basic/checklist/model/beeceptor_service.dart';
import 'package:tasks_basic/checklist/view_model/checklist_state.dart';

class ChecklistStore extends ChangeNotifier {
  final BeeceptorService _beeceptorService = BeeceptorService();

  final state = ChecklistState.empty();

  void getTaskList() async {
    try {
      await _beeceptorService
          .getTaskList()
          .then((value) => state.copyWith(isLoading: false, taskList: value));
      notifyListeners();
    } catch (e) {
      state.copyWith(error: e.toString());
      notifyListeners();
    }
  }
}
