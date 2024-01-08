part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthToggle extends AuthEvent {
  
  final AuthCurrentState currentState;

  AuthToggle({
    required this.currentState,
  });
}
