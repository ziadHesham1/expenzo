import 'dart:convert';

import 'package:expenzo/core/extensions/date_extensions.dart';
import 'package:expenzo/features/days/data/models/day_model.dart';
import 'package:expenzo/core/network/app_end_points.dart';
import 'package:expenzo/core/network/app_network_helper.dart';

class DayNetwork {
  final AppNetworkHelper _appNetworkHelper;

  DayNetwork(AppNetworkHelper appNetworkHelper)
      : _appNetworkHelper = appNetworkHelper;
  Future<DayModel?> getTodayData() async {
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.days,
        extra: 'date=eq.${DateTime.now().toServerFormat}');
    try {
      final response = await _appNetworkHelper.get(uri);
      // Check if the response is successful
      if (response != null && response is List) {
        if (response.isEmpty) {
          return null;
        }
        // Parse the response data into a list of maps
        List<Map<String, dynamic>> days =
            List<Map<String, dynamic>>.from(response);

        return DayModel.fromJson(days.first);
      } else {
        throw Exception('Failed to load days: $response');
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> createTodayRecord({
    required double dailyLimit,
  }) async {
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.days,
        extra: 'date=eq.${DateTime.now().toServerFormat}');
    try {
      await _appNetworkHelper.post(
        uri,
        data: json.encode(DayModel.empty()
            .copyWith(
              date: DateTime.now(),
              dayOfWeek: DateTime.now().weekday,
              dailyLimit: dailyLimit,
            )
            .toJson()),
      );
    } catch (e) {
      print('expenses_network > addExpense > error: $e');
    }
  }

  Future<void> updateTodayTotalSpending(double totalSpending) async {
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.days,
        extra: 'date=eq.${DateTime.now().toServerFormat}');
    try {
      await _appNetworkHelper.patch(
        uri,
        json.encode(DayModel.empty()
            .copyWith(
              totalSpending: totalSpending,
            )
            .toJson()),
      );
    } catch (e) {
      print('expenses_network > updateTodayTotalSpending > error: $e');
    }
  }

  Future<List<DayModel>> fetchDaysByWeekId() async {
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.days,
        // ?select=*&week(start_date).eq.your_date
        extra:
            'select=*&week(start_date).eq.${DateTime.now().firstDayInWeek.toServerFormat}&order=date.desc');
    try {
      final response = await _appNetworkHelper.get(uri);
      // Check if the response is successful
      if (response != null && response is List) {
        // Parse the response data into a list of maps
        List<Map<String, dynamic>> days =
            List<Map<String, dynamic>>.from(response);

        List<DayModel> dayModelList = days.map((item) {
          return DayModel.fromJson(item);
        }).toList();

        return dayModelList;
      } else {
        throw Exception('Failed to load days: $response');
      }
    } catch (e) {
      return [];
    }
  }
}
