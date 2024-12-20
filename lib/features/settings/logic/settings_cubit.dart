import 'package:expenzo/core/di.dart';
import 'package:expenzo/features/settings/data/models/settings_model.dart';
import 'package:expenzo/features/settings/data/network/settings_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState.initial());

  getSettings() async {
    emit(const SettingsState.loading());
    SettingsModel result = await getIt<SettingsNetwork>().getSettings();
    emit(SettingsState.loaded(settings: result));
  }

  updateSetting(SettingsModel settingsModel) async {
    emit(const SettingsState.loading());
    await getIt<SettingsNetwork>().updateSetting(settingsModel);
    getSettings();
  }
}
