import 'package:flutter/material.dart';
import 'package:tasks_basic/checklist/model/beeceptor_service.dart';
import 'package:tasks_basic/checklist/view_model/checklist_state.dart';
import 'package:tasks_basic/checklist/view_model/checklist_store.dart';

class ChecklistView extends StatefulWidget {
  const ChecklistView({super.key});

  @override
  State<ChecklistView> createState() => _ChecklistViewState();
}

class _ChecklistViewState extends State<ChecklistView> {
  BeeceptorService beeceptorService = BeeceptorService();
  final store = ChecklistStore();

  @override
  void initState() {
    super.initState();
    store.addListener(() {
      setState(() {});
    });
    store.getTaskList();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container();
    final state = store.state;

    if (state is ChecklistStateLoading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (state is ChecklistStateError) {
      body = Center(
          child: Column(
        children: [
          Text(state.error),
          ElevatedButton(
              onPressed: store.getTaskList, child: const Text('Retry')),
        ],
      ));
    } else if (state is ChecklistStateEmpty) {
      body = Center(
          child: ElevatedButton(
              onPressed: store.getTaskList, child: const Text('Load')));
    } else if (state is ChecklistStateLoaded) {
      body = SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: state.taskList.length,
              itemBuilder: (context, index) => ListTile(
                    leading: Checkbox(
                      value: state.taskList[index].completed,
                      onChanged: (value) {},
                    ),
                    title: Text(state.taskList[index].title),
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
