import 'package:mobx/mobx.dart';
import 'package:tasks_basic/login/view_model/login_store.dart';
part 'text_form_field_store.g.dart';

class TextFormFieldStore = TextFieldStoreBase with _$TextFormFieldStore;

abstract class TextFieldStoreBase with Store {
  var loginStore = LoginStore();

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
      validateEmail(loginStore.email) == null &&
      validatePass(loginStore.password) == null;
}
