import 'dart:convert';

import 'package:expenzo/core/extensions/date_extensions.dart';
import 'package:expenzo/features/month/data/models/month_model.dart';
import 'package:expenzo/core/network/app_end_points.dart';
import 'package:expenzo/core/network/app_network_helper.dart';

class MonthNetwork {
  final AppNetworkHelper _appNetworkHelper;

  MonthNetwork(AppNetworkHelper appNetworkHelper)
      : _appNetworkHelper = appNetworkHelper;
  Future<MonthModel?> getMonthData() async {
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.months,
        extra:
            'start_date=eq.${DateTime.now().copyWith(day: 1).toServerFormat}');
    try {
      final response = await _appNetworkHelper.get(uri);
      // Check if the response is successful
      if (response != null && response is List) {
        if (response.isEmpty) {
          return null;
        }
        // Parse the response data into a list of maps
        List<Map<String, dynamic>> months =
            List<Map<String, dynamic>>.from(response);

        return MonthModel.fromJson(months.first);
      } else {
        throw Exception('Failed to load months: $response');
      }
    } catch (e) {
      return null;
    }
  }

  // Future<void> createMonthRecord({
  //   required double dailyLimit,
  // }) async {
  //   var uri = AppEndPoints.generateUri(
  //       path: AppEndPoints.months,
  //       extra: 'date=eq.${DateTime.now().toServerFormat}');
  //   try {
  //     await _appNetworkHelper.post(
  //       uri,
  //       data: json.encode(MonthModel.empty()
  //           .copyWith(
  //             date: DateTime.now().toServerFormat,
  //             monthOfWeek: DateTime.now().weekmonth,
  //             dailyLimit: dailyLimit,
  //           )
  //           .toJson()),
  //     );
  //   } catch (e) {
  //     print('expenses_network > addExpense > error: $e');
  //   }
  // }

  Future<void> updateMonthTotalSpending(double totalSpending) async {
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.months,
        extra:
            'start_date=eq.${DateTime.now().copyWith(day: 1).toServerFormat}');
    try {
      await _appNetworkHelper.patch(
        uri,
        json.encode(MonthModel.empty()
            .copyWith(
              totalSpending: totalSpending,
            )
            .toJson()),
      );
    } catch (e) {
      print('expenses_network > updateMonthTotalSpending > error: $e');
    }
  }

  // Future<List<MonthModel>> fetchMonthsByWeekId(int weekId) async {
  //   var uri = AppEndPoints.generateUri(
  //       path: AppEndPoints.months, extra: 'week_id eq $weekId&select=*');
  //   try {
  //     final response = await _appNetworkHelper.get(uri);
  //     // Check if the response is successful
  //     if (response != null && response is List) {
  //       // Parse the response data into a list of maps
  //       List<Map<String, dynamic>> months =
  //           List<Map<String, dynamic>>.from(response);

  //       List<MonthModel> monthModelList = months.map((item) {
  //         return MonthModel.fromJson(item);
  //       }).toList();

  //       return monthModelList;
  //     } else {
  //       throw Exception('Failed to load months: $response');
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }
}
