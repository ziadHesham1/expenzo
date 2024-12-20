import 'dart:convert';

import '../../../../core/extensions/date_extensions.dart';
import '../../../../core/network/app_end_points.dart';
import '../../../../core/network/app_network_helper.dart';
import '../models/week_model.dart';

class WeekNetwork {
  final AppNetworkHelper _appNetworkHelper;

  WeekNetwork(AppNetworkHelper appNetworkHelper)
      : _appNetworkHelper = appNetworkHelper;

  Future<WeekModel?> getWeekData() async {
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.weeks,
        extra:
            'start_date=eq.${DateTime.now().copyWith(day: 5).toServerFormat}');
    try {
      final response = await _appNetworkHelper.get(uri);

      if (response != null && response is List) {
        if (response.isEmpty) {
          return null;
        }

        List<Map<String, dynamic>> weeks =
            List<Map<String, dynamic>>.from(response);

        return WeekModel.fromJson(weeks.first);
      } else {
        throw Exception('Failed to load weeks: $response');
      }
    } catch (e) {
      return null;
    }
  }

  Future<double> getDayTotalWeekSpending(int weekId) async {
    var getSumUri =
        AppEndPoints.generateUri(path: 'rpc/get_total_week_spending');
    try {
      return await _appNetworkHelper.post(getSumUri,
          data: json.encode({"p_week_id": weekId}));
    } catch (e) {
      print('week_network > addExpense > error: e');
    }
    return 0;
  }

  Future<void> updateWeekTotalSpending(int weekId) async {
    var totalSpending = await getDayTotalWeekSpending(weekId);
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.weeks,
        extra: 'start_date=eq.${DateTime.now().firstDayInWeek.toServerFormat}');
    try {
      await _appNetworkHelper.patch(
        uri,
        json.encode(WeekModel.empty()
            .copyWith(
              totalSpending: totalSpending,
            )
            .toJson()),
      );
    } catch (e) {
      print('week_network > updateWeekTotalSpending > error: $e');
    }
  }

  // update week essential budget
  Future<void> updateWeekBudget({
    required double essentialBudget,
    required double funBudget,
  }) async {
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.weeks,
        extra: 'start_date=eq.${DateTime.now().firstDayInWeek.toServerFormat}');
    try {
      await _appNetworkHelper.patch(
          uri,
          json.encode(WeekModel.empty()
              .copyWith(essentialBudget: essentialBudget, funBudget: funBudget)
              .toJson()));
    } catch (e) {
      print('week_network > updateWeekData > error: $e');
    }
  }
}
