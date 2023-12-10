import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:tasks_basic/checklist/model/task_dto.dart';

import 'task_model.dart';

class BeeceptorService {
  http.Client client = http.Client();

  Future<ObservableList<TaskModel>> getTaskList() async {
    http.Response resp = await client
        .get(Uri.parse('https://trassos-tasks.free.beeceptor.com/todos'));
    if (resp.statusCode == 200) {
      List<TaskDTO> taskList = List<TaskDTO>.from(
          json.decode(resp.body).map((x) => TaskDTO.fromJson(x)));
      return taskList
          .map((e) => TaskModel(
                id: e.id,
                title: e.title,
                completed: e.completed,
              ))
          .toList()
          .asObservable();
    } else {
      throw Exception('Failed to load task list');
    }
  }
}
