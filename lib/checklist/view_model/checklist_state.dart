// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tasks_basic/checklist/model/task_dto.dart';

sealed class ChecklistState {}

class ChecklistStateEmpty extends ChecklistState {}

class ChecklistStateLoading extends ChecklistState {}

class ChecklistStateError extends ChecklistState {
  final String error;
  ChecklistStateError(this.error);
}

class ChecklistStateLoaded extends ChecklistState {
  final List<TaskDTO> taskList;
  ChecklistStateLoaded(this.taskList);
}
