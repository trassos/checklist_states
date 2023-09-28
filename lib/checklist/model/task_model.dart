import 'package:mobx/mobx.dart';
import 'package:tasks_basic/checklist/model/task_dto.dart';
part 'task_model.g.dart';

class TaskModel = _TaskModelBase with _$TaskModel;

abstract class _TaskModelBase with Store {
  _TaskModelBase(
      {required this.id, required this.title, required this.completed});

  _TaskModelBase.fromDTO(TaskDTO dto)
      : id = dto.id,
        title = dto.title,
        completed = dto.completed;

  @observable
  num id;

  @observable
  String title;

  @observable
  bool completed;

  @action
  setId(num value) => id = value;

  @action
  setTitle(String value) => title = value;

  @action
  setCompleted(bool value) => completed = value;
}
