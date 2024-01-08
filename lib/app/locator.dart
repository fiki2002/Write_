import 'package:get_it/get_it.dart';
import 'package:write/features/features.dart';

class SetUpLocators {
  static const SetUpLocators _instance = SetUpLocators._();
  const SetUpLocators._();
  factory SetUpLocators() => _instance;

  static final getIt = GetIt.instance;

  
  static void init() {
    setUpAuthLocator();
  }
}
