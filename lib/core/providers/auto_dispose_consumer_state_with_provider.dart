import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:exercise/core/di/injector_configurator.dart';

abstract class AutoDisposeConsumerStateWithProvider<
    Provider extends StateNotifier<State>,
    State,
    Widget extends ConsumerStatefulWidget> extends ConsumerState<Widget> {
  AutoDisposeConsumerStateWithProvider({
    dynamic param1,
    dynamic param2,
  })  : _param1 = param1,
        _param2 = param2;

  final dynamic _param1;
  final dynamic _param2;

  late AutoDisposeStateNotifierProvider<Provider, State> provider;

  @override
  @mustCallSuper
  void initState() {
    super.initState();

    provider = AutoDisposeStateNotifierProvider<Provider, State>(
      (ref) => getIt<Provider>(
        param1: _param1,
        param2: _param2,
      ),
    );

    /// onInit method in [BaseProvider] might be called only when the provider instance is created
    /// To create the instance, any action in a widget must be called.
    /// This line helps to create the instance without modifying a widget
    ref.read(provider);
  }
}
