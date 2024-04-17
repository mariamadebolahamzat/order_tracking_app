import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:order_tracking_app/src/domain/core/exceptions.dart';
import 'package:order_tracking_app/src/shared/router/app_router.dart';

typedef AppViewModelRef<T extends AppViewModel> = List<T>;

enum ViewState { idle, loading, success, error }

@immutable
abstract base class AppViewModel extends Equatable {
  const AppViewModel();

  ViewState get currentState;

  AppException get error;

  @override
  bool? get stringify => true;
}

Future<void> launch<E extends AppViewModel>(
  AppViewModelRef<E> model,
  Future<void> Function(AppViewModelRef<E> model) function, {
  bool displayError = true,
}) async {
  await Future.sync(() => function(model));

  if (model.isEmpty || !displayError) return;
  model._state.displayError();
}

extension ViewModelX<T extends AppViewModel> on T {
  AppViewModelRef<T> get ref => [this];

  void displayError() async {
    if (currentState != ViewState.error) return;
    assert(error is! EmptyException, 'Please pass appropriate exception');

    showError(error.toString());
  }
}

extension ViewModelRefX<T extends AppViewModel> on AppViewModelRef<T> {
  AppViewModelRef<T> _assign(T value) => this..insert(0, value);

  T get _state => elementAt(0);

  T emit(T value) => _assign(value)._state;
}

void showError(String message) {
  final context = AppRouter.navKey.currentContext!;
  final snackbar = SnackBar(
    backgroundColor: Theme.of(context).colorScheme.error,
    duration: const Duration(milliseconds: 3000),
    content: Text(
      message,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.surface),
    ),
  );

  ScaffoldMessenger.maybeOf(context)?.showSnackBar(snackbar);
}
