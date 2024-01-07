import 'package:get_it/get_it.dart';
import 'package:write/app/app.dart';
import 'package:write/features/auth/auth.dart';

void setUpAuthLocator() {
  final GetIt getIt = SetUpLocators.getIt;

  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(),
  );
}
