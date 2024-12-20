import 'package:expenzo/features/budget/logic/month_budget_cubit.dart';
import 'package:expenzo/features/days/logic/day_cubit.dart';
import 'package:expenzo/features/month/logic/month_cubit.dart';
import 'package:expenzo/features/settings/logic/settings_logic_index.dart';
import 'package:expenzo/features/week/logic/week_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;
  const AppBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => MonthBudgetCubit(),
      ),
      BlocProvider(
        create: (context) => SettingsCubit()..getSettings(),
      ),
      BlocProvider(
        create: (context) => TodayCubit(),
      ),
      BlocProvider(
        create: (context) => WeekCubit(),
      ),
      BlocProvider(
        create: (context) => MonthCubit(),
      ),
    ], child: child);
  }
}
