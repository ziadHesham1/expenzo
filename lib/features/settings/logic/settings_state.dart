import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/settings_model.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded({required SettingsModel settings}) =
      Loaded;
  const factory SettingsState.error({required String message}) = _Error;
}
