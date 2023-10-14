import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasks_basic/checklist/view_model/checklist_store.dart';

class ChecklistView extends StatefulWidget {
  const ChecklistView({super.key});

  @override
  State<ChecklistView> createState() => _ChecklistViewState();
}

class _ChecklistViewState extends State<ChecklistView> {
  ChecklistStore checklistStore = ChecklistStore();

  @override
  void initState() {
    checklistStore.getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (checklistStore.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (checklistStore.error.isNotEmpty) {
          return Observer(builder: (_) {
            return Center(
                child: Column(
              children: [
                Text(checklistStore.error),
                ElevatedButton(
                    onPressed: checklistStore.getList,
                    child: const Text('Retry')),
              ],
            ));
          });
        } else if (checklistStore.taskList.isEmpty) {
          return Observer(builder: (_) {
            return Center(
                child: ElevatedButton(
                    onPressed: checklistStore.getList,
                    child: const Text('Load')));
          });
        } else {
          return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return ListView.builder(
                    itemCount: checklistStore.filteredList.length,
                    itemBuilder: (context, index) => Observer(builder: (_) {
                      return ListTile(
                        title: Text(checklistStore.filteredList[index].title),
                        leading: Checkbox(
                          value: checklistStore.filteredList[index].completed,
                          onChanged: (value) {
                            checklistStore.setTaskStatus(index, value);
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            checklistStore.removeTask(index);
                          },
                        ),
                      );
                    }),
                  );
                }),
              ));
        }
      }),
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Pesquisar',
          ),
          onChanged: (value) {
            checklistStore.setFilter(value);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _dialog(context);
          },
          child: const Icon(Icons.add)),
    );
  }

  _dialog(BuildContext context) {
    var title = '';
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Adicionar item'),
            content: TextField(
              onChanged: (value) {
                title = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Novo item',
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  checklistStore.addTask(title);
                  Navigator.pop(context);
                },
                child: const Text('Salvar'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
            ],
          );
        });
  }
}
