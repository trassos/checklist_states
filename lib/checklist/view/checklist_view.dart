import 'package:flutter/material.dart';
import 'package:tasks_basic/checklist/model/beeceptor_service.dart';
import 'package:tasks_basic/checklist/model/task_dto.dart';

class ChecklistView extends StatefulWidget {
  const ChecklistView({super.key});

  @override
  State<ChecklistView> createState() => _ChecklistViewState();
}

class _ChecklistViewState extends State<ChecklistView> {
  BeeceptorService beeceptorService = BeeceptorService();
  var error = '';
  var isLoading = true;
  var taskList = <TaskDTO>[];

  getTaskList() async {
    try {
      await beeceptorService.getTaskList().then((value) => taskList = value);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      error = e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getTaskList();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container();

    if (isLoading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (error.isNotEmpty) {
      body = Center(
          child: ElevatedButton(
              onPressed: getTaskList, child: const Text('Retry')));
    } else if (taskList.isEmpty) {
      body = Center(
          child: ElevatedButton(
              onPressed: getTaskList, child: const Text('Load')));
    } else {
      body = SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) => ListTile(
                    leading: Checkbox(
                      value: taskList[index].completed,
                      onChanged: (value) {},
                    ),
                    title: Text(taskList[index].title),
                  )),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist'),
      ),
      body: body,
    );
  }
}
