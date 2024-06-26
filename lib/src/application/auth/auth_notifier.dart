import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_tracking_app/src/application/auth/auth_ui_state.dart';
import 'package:order_tracking_app/src/application/core/app_view_model.dart';
import 'package:order_tracking_app/src/domain/auth/repository/auth_repository_interface.dart';

class AuthStateNotifier extends StateNotifier<AuthUiState> {
  final AuthRepositoryInterface _authRepo;

  AuthStateNotifier(this._authRepo) : super(const AuthUiState.initial());

  Future<void> continueWithGoogleLoginOnTap() async {
    await launch(state.ref, (model) async {
      state = model.emit(state.copyWith(currentState: ViewState.loading));
      final result = await _authRepo.signInWithGoogle();
      state = result.fold(
        (left) => model.emit(state.copyWith(currentState: ViewState.error, error: left)),
        (right) => model.emit(state.copyWith(currentState: ViewState.success)),
      );
    });
  }
}

final authStateNotifierProvider =
    StateNotifierProvider.autoDispose<AuthStateNotifier, AuthUiState>((ref) {
  return AuthStateNotifier(ref.read(authRepositoryProvider));
});
