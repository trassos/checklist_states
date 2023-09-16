import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
//automatizar com o build_runner flutter pub run build_runner build watch
part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = '';
  @action
  setEmail(newEmail) {
    email = newEmail;
  }

  @action
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your e-mail';
    } else if (!value.contains('@')) {
      return 'Please enter a valid e-mail';
    } else {
      return null;
    }
  }

  @observable
  String password = '';
  @action
  setPass(newPass) {
    password = newPass;
  }

  @action
  String? validatePass(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else {
      return null;
    }
  }

  @computed
  bool get isFormValid =>
      validateEmail(email) == null && validatePass(password) == null;

  @observable
  bool isSigned = false;
  @action
  setIsSigned(newIsSigned) {
    isSigned = newIsSigned;
  }

  @computed
  String get fullData => '$email $password';

  dispose() {}
}
