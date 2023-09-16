import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_basic/counter/view_model/counter_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasks_basic/login/view_model/login_store.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final counterStore = CounterStore();
  LoginStore loginStore = GetIt.I<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${loginStore.email} ${loginStore.password}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Observer(builder: (_) {
              return Text(
                '${counterStore.counter}',
                style: Theme.of(context).textTheme.displayLarge,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterStore.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
