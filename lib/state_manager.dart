import 'package:flutter/material.dart';

class Manager<T extends BaseState> extends ValueNotifier<T> {
  Manager(T state) : super(state);

  T get state => value;

  void emit(T newState) => value = newState;
}

class BaseState {
  final bool isLoading;

  BaseState({this.isLoading = false});
}
