import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tasks_basic/checklist/model/task_dto.dart';

class BeeceptorService {
  http.Client client = http.Client();

  Future<List<TaskDTO>> getTaskList() async {
    http.Response resp = await client
        .get(Uri.parse('https://trassos-tasks.free.beeceptor.com/todos'));
    if (resp.statusCode == 200) {
      List<TaskDTO> taskList = List<TaskDTO>.from(
          json.decode(resp.body).map((x) => TaskDTO.fromJson(x)));
      return taskList;
    } else {
      throw Exception('Failed to load task list');
    }
  }
}
