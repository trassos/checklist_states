// No projeto MobX as ações mudam os observáveis,
// e os observáveis notificam reações
// e mudam a interface do usuário.

import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'counter_store.g.dart';

class CounterStore = StoreBase with _$CounterStore;

abstract class StoreBase with Store {
  @observable
  int counter = 0;

  @action
  increment() {
    counter++;
  }
}
