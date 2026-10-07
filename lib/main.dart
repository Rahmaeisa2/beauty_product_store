import 'package:flutter/material.dart';

import 'core/di/service_locator.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/routes_names.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: AppRoutes.onGenerateRoute,

      initialRoute: RouteNames.splash,

      themeMode: ThemeMode.system,
    );
  }
}
