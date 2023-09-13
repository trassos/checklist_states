// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tasks_basic/checklist/model/task_dto.dart';

class ChecklistState {
  final List<TaskDTO> taskList;
  final String error;
  final bool isLoading;

  ChecklistState({
    required this.taskList,
    required this.error,
    required this.isLoading,
  });

  factory ChecklistState.empty() {
    return ChecklistState(
      taskList: [],
      error: '',
      isLoading: false,
    );
  }

  ChecklistState copyWith({
    List<TaskDTO>? taskList,
    String? error,
    bool? isLoading,
  }) {
    return ChecklistState(
      taskList: taskList ?? this.taskList,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
