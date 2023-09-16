// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_form_field_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextFormFieldStore on TextFieldStoreBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'TextFieldStoreBase.isFormValid'))
          .value;

  late final _$TextFieldStoreBaseActionController =
      ActionController(name: 'TextFieldStoreBase', context: context);

  @override
  String? validateEmail(String? value) {
    final _$actionInfo = _$TextFieldStoreBaseActionController.startAction(
        name: 'TextFieldStoreBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$TextFieldStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePass(String? value) {
    final _$actionInfo = _$TextFieldStoreBaseActionController.startAction(
        name: 'TextFieldStoreBase.validatePass');
    try {
      return super.validatePass(value);
    } finally {
      _$TextFieldStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFormValid: ${isFormValid}
    ''';
  }
}
