// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskModel on _TaskModelBase, Store {
  late final _$idAtom = Atom(name: '_TaskModelBase.id', context: context);

  @override
  num get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(num value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$titleAtom = Atom(name: '_TaskModelBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$completedAtom =
      Atom(name: '_TaskModelBase.completed', context: context);

  @override
  bool get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(bool value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  late final _$_TaskModelBaseActionController =
      ActionController(name: '_TaskModelBase', context: context);

  @override
  dynamic setId(num value) {
    final _$actionInfo = _$_TaskModelBaseActionController.startAction(
        name: '_TaskModelBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_TaskModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_TaskModelBaseActionController.startAction(
        name: '_TaskModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_TaskModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCompleted(bool value) {
    final _$actionInfo = _$_TaskModelBaseActionController.startAction(
        name: '_TaskModelBase.setCompleted');
    try {
      return super.setCompleted(value);
    } finally {
      _$_TaskModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
completed: ${completed}
    ''';
  }
}
