import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:write/core/core.dart';
import 'package:write/features/auth/auth.dart';

extension BuildContextNotifier on BuildContext {
  AuthBloc get auth => BlocProvider.of<AuthBloc>(this);
}
