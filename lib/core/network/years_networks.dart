import 'dart:convert';
import 'package:expenzo/core/network/app_end_points.dart';
import 'package:expenzo/core/network/app_network_helper.dart';

class YearsNetworks {
  final AppNetworkHelper _appNetworkHelper;

  YearsNetworks(AppNetworkHelper appNetworkHelper)
      : _appNetworkHelper = appNetworkHelper;
  createNewYear() async {
    var uri = AppEndPoints.generateUri(path: AppEndPoints.years);

    var data = json.encode({"year": 2024});
    var response = await _appNetworkHelper.post(uri, data: data);
    if (response != null && response is List) {
    } else {}
  }

  getAllYears() async {
    var uri = AppEndPoints.generateUri(path: AppEndPoints.years);

    var response = await _appNetworkHelper.get(uri);
    if (response != null && response is List) {
    } else {}
  }
}
