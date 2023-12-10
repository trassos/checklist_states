import 'package:mobx/mobx.dart';
part 'task_model.g.dart';

// ignore: library_private_types_in_public_api
class TaskModel = _TaskModelBase with _$TaskModel;

abstract class _TaskModelBase with Store {
  _TaskModelBase(
      {required this.id, required this.title, required this.completed});

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
