import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/core/theme/app_theme.dart';
import 'package:taski_to_do_challenge/routes/pages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: Pages.values,
      initialRoute: Routes.dashboard,
    );
  }
}
