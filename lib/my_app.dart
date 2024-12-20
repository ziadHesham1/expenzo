import 'package:flutter/material.dart';

import 'app_bloc_providers.dart';
import 'app_listeners.dart';
import 'app_navbar.dart';
import 'core/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBlocProviders(
        child: AppListeners(
      child: MaterialApp(
        title: 'Expenzo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.background),
          primaryColor: Colors.blue,
        ),
        home: const AppNavbar(),
      ),
    ));
  }
}
