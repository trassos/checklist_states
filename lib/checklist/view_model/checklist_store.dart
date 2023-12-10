import 'package:mobx/mobx.dart';
import 'package:tasks_basic/checklist/model/beeceptor_service.dart';
import 'package:tasks_basic/checklist/model/task_model.dart';
part 'checklist_store.g.dart';

// ignore: library_private_types_in_public_api
class ChecklistStore = _ChecklistStoreBase with _$ChecklistStore;

abstract class _ChecklistStoreBase with Store {
  final BeeceptorService _beeceptorService = BeeceptorService();

  @observable
  ObservableList<TaskModel> taskList = ObservableList<TaskModel>.of([]);
  @action
  setTaskList(ObservableList<TaskModel> value) => taskList = value;

  @observable
  var error = '';
  @action
  setError(String value) => error = value;

  @observable
  var isLoading = true;
  @action
  setIsLoading(bool value) => isLoading = value;

  @observable
  String filter = '';
  @action
  setFilter(String value) => filter = value;
  @computed
  ObservableList<TaskModel> get filteredList {
    if (filter.isEmpty) {
      return taskList;
    } else {
      return taskList
          .where((element) =>
              element.title.toLowerCase().contains(filter.toLowerCase()))
          .toList()
          .asObservable();
    }
  }

  @action
  setTaskStatus(int index, bool? value) {
    value ??= false;
    taskList[index].completed = value;
  }

  @action
  addTask(String title) {
    taskList.add(TaskModel(
      id: taskList.length + 1,
      title: title,
      completed: false,
    ));
  }

  @action
  removeTask(int index) {
    taskList.removeAt(index);
  }

  getList() async {
    try {
      await _beeceptorService.getTaskList().then((value) {
        setTaskList(value);
        setIsLoading(false);
      });
    } on Exception catch (e) {
      setError(e.toString());
      // print(e.toString());
    }
  }
}
