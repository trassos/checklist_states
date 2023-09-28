// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChecklistStore on _ChecklistStoreBase, Store {
  late final _$taskListAtom =
      Atom(name: '_ChecklistStoreBase.taskList', context: context);

  @override
  ObservableList<TaskModel> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(ObservableList<TaskModel> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_ChecklistStoreBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ChecklistStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_ChecklistStoreBaseActionController =
      ActionController(name: '_ChecklistStoreBase', context: context);

  @override
  dynamic setTaskList(ObservableList<TaskModel> value) {
    final _$actionInfo = _$_ChecklistStoreBaseActionController.startAction(
        name: '_ChecklistStoreBase.setTaskList');
    try {
      return super.setTaskList(value);
    } finally {
      _$_ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(String value) {
    final _$actionInfo = _$_ChecklistStoreBaseActionController.startAction(
        name: '_ChecklistStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$_ChecklistStoreBaseActionController.startAction(
        name: '_ChecklistStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTaskStatus(int index, bool? value) {
    final _$actionInfo = _$_ChecklistStoreBaseActionController.startAction(
        name: '_ChecklistStoreBase.setTaskStatus');
    try {
      return super.setTaskStatus(index, value);
    } finally {
      _$_ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addTask(String title) {
    final _$actionInfo = _$_ChecklistStoreBaseActionController.startAction(
        name: '_ChecklistStoreBase.addTask');
    try {
      return super.addTask(title);
    } finally {
      _$_ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeTask(int index) {
    final _$actionInfo = _$_ChecklistStoreBaseActionController.startAction(
        name: '_ChecklistStoreBase.removeTask');
    try {
      return super.removeTask(index);
    } finally {
      _$_ChecklistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskList: ${taskList},
error: ${error},
isLoading: ${isLoading}
    ''';
  }
}
