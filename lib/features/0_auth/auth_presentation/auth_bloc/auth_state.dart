part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  final bool isFirstEntry;
  final AuthError? error;
  final String? successMessage;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.isFirstEntry = true,
    this.error,
    this.successMessage,
  });

  const AuthState.loading()
      : this._(
    status: AuthStatus.loading,
    isFirstEntry: false,
  );

  const AuthState.unknown() : this._();

  const AuthState.authenticated()
      : this._(
    status: AuthStatus.authenticated,
    isFirstEntry: false,
  );

  const AuthState.guest()
      : this._(
    status: AuthStatus.guest,
    isFirstEntry: false,
  );

  const AuthState.firstEntry() : this._(status: AuthStatus.guest);

  const AuthState.error({AuthError error = AuthError.unknown})
      : this._(status: AuthStatus.unknown, isFirstEntry: false, error: error);

  const AuthState.forgotPasswordSuccess(String message)
      : this._(status: AuthStatus.unknown, successMessage: message);

  @override
  List<Object?> get props => [status, isFirstEntry, error, successMessage];
}
