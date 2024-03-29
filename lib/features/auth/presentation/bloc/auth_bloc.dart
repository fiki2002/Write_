import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateInitial()) {
    on<AuthToggle>(
      (event, emit) {
        emit(AuthStateInitial(state: event.currentState));
      },
    );
  }
}

enum AuthCurrentState { signIn, signUp }
