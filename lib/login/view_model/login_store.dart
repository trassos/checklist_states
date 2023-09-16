import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @computed
  String get fullData => '$email $password';

  @action
  setEmail(newEmail) {
    email = newEmail;
  }

  @action
  setPass(newPass) {
    password = newPass;
  }
}
