import 'package:order_tracking_app/src/application/core/app_view_model.dart';
import 'package:order_tracking_app/src/domain/core/exceptions.dart';

final class AuthUiState extends AppViewModel {
  @override
  final ViewState currentState;
  @override
  final AppException error;

  const AuthUiState({
    required this.currentState,
    required this.error,
  });

  const AuthUiState.initial()
      : this(
          currentState: ViewState.idle,
          error: const EmptyException(),
        );

  AuthUiState copyWith({
    ViewState? currentState,
    AppException? error,
  }) {
    return AuthUiState(
      currentState: currentState ?? this.currentState,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [currentState, error];
}
