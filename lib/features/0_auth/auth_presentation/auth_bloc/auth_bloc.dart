import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/cache/auth_cache_manager.dart';
import '../../../../core/utils/enum/auth_enums.dart';
import '../../auth_domain/iauth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService;
  final AuthCacheManager authCacheManager;

  AuthBloc(this.authService, this.authCacheManager)
      : super(const AuthState.unknown()) {
    on<AppStarted>((event, emit) async {
      try {
        if (await authCacheManager.isLoggedIn()) {
          await authCacheManager.updateTokenFromStorage();
          emit(const AuthState.authenticated());
        } else {
          emit((await authCacheManager.isFirstEntry())
              ? const AuthState.firstEntry()
              : const AuthState.guest());
        }
      } on SocketException {
        emit(const AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        emit(const AuthState.error());
      }
    });

    on<LoginRequested>(
          (event, emit) async {
        emit(const AuthState.loading());
        final String? response = await authService.login(
            email: event.email,
            password: event.password,
            deviceToken: event.fcmToken);
        if (response != null) {
          await authCacheManager.updateToken(response);
          await authCacheManager.updateLoggedIn(true);
          emit(const AuthState.authenticated());
        } else {
          emit(const AuthState.error(error: AuthError.wrongEmailOrPassword));
          add(LogoutRequested());
        }
      },
    );

    on<LogoutRequested>((event, emit) async {
      try {
        await authCacheManager.signOut();
        emit(const AuthState.guest());
      } catch (_) {}
    });

    on<ForgotPasswordRequested>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final response = await authService.forgotPassword(email: event.email);
        if (response != null) {
          emit(AuthState.forgotPasswordSuccess('Password reset link sent to the registered email address.'));
        } else {
          emit(const AuthState.error(error: AuthError.unknown));
        }
      } on SocketException {
        emit(const AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        emit(const AuthState.error());
      }
    });
  }
}
