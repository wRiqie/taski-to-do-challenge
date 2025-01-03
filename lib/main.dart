import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/core/values/inject.dart';
import 'package:taski_to_do_challenge/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Inject.init();

  runApp(const AppWidget());
}
