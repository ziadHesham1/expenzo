import 'package:expenzo/features/settings/data/models/settings_model.dart';
import 'package:expenzo/features/week/data/network/week_network.dart';

import '../../../../core/network/app_end_points.dart';
import '../../../../core/network/app_network_helper.dart';
import 'dart:convert';

class SettingsNetwork {
  final AppNetworkHelper _appNetworkHelper;
  final WeekNetwork _weekNetwork;

  SettingsNetwork(AppNetworkHelper appNetworkHelper, WeekNetwork weekNetwork)
      : _appNetworkHelper = appNetworkHelper,
        _weekNetwork = weekNetwork;
  Future<SettingsModel> getSettings() async {
    var uri = AppEndPoints.generateUri(path: AppEndPoints.settings);
    try {
      final response = await _appNetworkHelper.get(uri);
      // Check if the response is successful
      if (response != null && response is List) {
        // Parse the response data into a list of maps
        List<Map<String, dynamic>> settings =
            List<Map<String, dynamic>>.from(response);

        return SettingsModel.fromJson(settings[0]);
      } else {
        throw Exception('Failed to load settings: $response');
      }
    } catch (e) {
      return const SettingsModel(totalBudget: 0, dailyBudget: 0);
    }
  }

  Future<void> updateSetting(SettingsModel settingsModel) async {
    var uri =
        AppEndPoints.generateUri(path: AppEndPoints.settings, extra: 'id=eq.1');

    try {
      await _appNetworkHelper.patch(uri, json.encode(settingsModel.toJson()));
      _weekNetwork.updateWeekBudget(
        essentialBudget: settingsModel.weeklyEssentialBudget,
        funBudget: settingsModel.weeklyFunBudget,
      );
      // Check if the response is successful
    } catch (e) {
      print('settings_network > addSetting > error: e');
    }
  }
}
///total = x
///week = x/4
///