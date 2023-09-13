import 'package:flutter/material.dart';
import 'package:tasks_basic/checklist/model/beeceptor_service.dart';
import 'package:tasks_basic/checklist/view_model/checklist_state.dart';

class ChecklistStore extends ChangeNotifier {
  final BeeceptorService _beeceptorService = BeeceptorService();

  ChecklistState state = ChecklistStateEmpty();

  void getTaskList() async {
    state = ChecklistStateLoading();
    notifyListeners();
    try {
      await _beeceptorService
          .getTaskList()
          .then((value) => state = ChecklistStateLoaded(value));
      notifyListeners();
    } catch (e) {
      state = ChecklistStateError(e.toString());
      notifyListeners();
    }
  }
}
