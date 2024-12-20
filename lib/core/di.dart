import 'package:dio/dio.dart';
import 'package:expenzo/features/month/data/network/month_network.dart';
import 'package:expenzo/features/month/logic/month_cubit.dart';
import 'package:expenzo/features/week/data/network/week_network.dart';
import 'package:get_it/get_it.dart';

import '../features/budget/data/network/expenses_network.dart';
import '../features/days/data/networks/day_network.dart';
import '../features/settings/data/network/settings_network.dart';
import 'network/app_network_helper.dart';
import 'network/years_networks.dart';

final GetIt getIt = GetIt.instance;

class DependencyInjection {
  static final DependencyInjection _singleton = DependencyInjection._();

  factory DependencyInjection() => _singleton;

  DependencyInjection._();

  Future<void> registerSingleton() async {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerLazySingleton(() => AppNetworkHelper(getIt()));
    getIt.registerLazySingleton(() => ExpensesNetwork(getIt()));
    getIt.registerLazySingleton(() => DayNetwork(getIt()));
    getIt.registerLazySingleton(() => WeekNetwork(getIt()));

    getIt.registerLazySingleton(() => MonthNetwork(getIt()));

    getIt.registerLazySingleton(() => YearsNetworks(getIt()));
    getIt.registerLazySingleton(() => SettingsNetwork(getIt(), getIt()));
  }
}
