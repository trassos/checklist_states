import 'package:flutter/material.dart';
import 'package:tasks_basic/checklist/model/beeceptor_service.dart';

class ChecklistView extends StatelessWidget {
  const ChecklistView({super.key});

  @override
  Widget build(BuildContext context) {
    BeeceptorService beeceptorService = BeeceptorService();
    var taskList = beeceptorService.getTaskList();

    return Scaffold(
        body: FutureBuilder(
            future: taskList,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => ListTile(
                                  leading: Checkbox(
                                    value: snapshot.data?[index].completed,
                                    onChanged: (value) {},
                                  ),
                                  title:
                                      Text(snapshot.data?[index].title ?? ''),
                                )),
                      ))
                  : const Center(child: CircularProgressIndicator());
            }));
  }
}
