import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
//automatizar com o build_runner flutter pub run build_runner build watch
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = '';
  @action
  setEmail(newEmail) {
    email = newEmail;
  }

  @observable
  String password = '';
  @action
  setPass(newPass) {
    password = newPass;
  }

  @computed
  String get fullData => '$email $password';
}
