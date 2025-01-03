import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/ui/views/dashboard_view.dart';

part 'routes.dart';

class Pages {
  Pages._();

  static Map<String, Widget Function(BuildContext context)> values = {
    Routes.dashboard: (context) => const DashboardView(),
  };
}
