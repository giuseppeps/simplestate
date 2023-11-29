import 'package:flutter/material.dart';
import 'package:simple_state_manager/state_manager.dart';

class StateBuilder<T extends BaseState> extends StatefulWidget {
  final Manager<T> manager;
  final Widget Function(BuildContext context, T state) builder;

  const StateBuilder({
    super.key,
    required this.manager,
    required this.builder,
  });

  @override
  StateBuilderState<T> createState() => StateBuilderState<T>();
}

class StateBuilderState<T extends BaseState> extends State<StateBuilder<T>> {
  late T _currentState;

  @override
  void initState() {
    _currentState = widget.manager.value;
    widget.manager.addListener(_onStateChanged);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.manager.removeListener(_onStateChanged);
  }

  void _onStateChanged() =>
      setState(() => _currentState = widget.manager.value);

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _currentState);
  }
}
