import 'package:flutter/material.dart';
import 'package:simplestate/state_builder.dart';
import 'package:simplestate/state_manager.dart';

class PaymentManager extends Manager<SecondState> {
  PaymentManager() : super(SecondState.isEmpty());

  void setLoadingTrue() {
    emit(state.copyWith(isLoading: true));
  }

  void setLoadingFalse() {
    emit(state.copyWith(isLoading: false));
  }
}

// Tela
class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final PaymentManager _stateController = PaymentManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StateBuilder(
              manager: _stateController,
              builder: (context, state) {
                return Visibility(
                  visible: state.isLoading,
                  child: const CircularProgressIndicator(),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                !(_stateController.state.isLoading)
                    ? _stateController.setLoadingTrue()
                    : _stateController.setLoadingFalse();
              },
              child: const Text('Mudar isLoading'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondState extends BaseState {
  final ValueNotifier<bool> hasLoaded;

  SecondState({
    required this.hasLoaded,
    super.isLoading = false,
  });

  factory SecondState.isEmpty() =>
      SecondState(hasLoaded: ValueNotifier<bool>(false));

  SecondState copyWith({ValueNotifier<bool>? hasLoaded, bool? isLoading}) {
    return SecondState(
      hasLoaded: hasLoaded ?? this.hasLoaded,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentScreen(),
  ));
}
