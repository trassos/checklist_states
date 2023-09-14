// No projeto MobX as ações mudam os observáveis,
// e os observáveis notificam reações
// e mudam a interface do usuário.

import 'package:mobx/mobx.dart';

class CounterController {
  //Observáveis
  var counter = Observable(0);
  //Ações
  late Action increment;
  //Reações
  _increment() {
    counter.value++;
  }

  CounterController() {
    increment = Action(_increment);

    autorun((_) {
      print(counter.value);
    });
  }
}
