import 'package:expenzo/features/settings/logic/settings_logic_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppListeners extends StatelessWidget {
  final Widget child;
  const AppListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      child: child,
    );
  }
}
