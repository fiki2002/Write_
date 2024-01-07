part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthStateInitial extends AuthState {
  AuthStateInitial({
    this.state = AuthCurrentState.signIn,
  });

  final AuthCurrentState state;
}
