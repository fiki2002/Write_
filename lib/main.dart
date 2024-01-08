import 'package:flutter/material.dart';
import 'package:write/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SetUpLocators.init();
  runApp(const WriteApp());
}
