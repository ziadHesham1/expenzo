import '../../../../core/network/app_end_points.dart';
import '../../../../core/network/app_network_helper.dart';
import '../models/expense_item_model.dart';
import 'dart:convert';

class ExpensesNetwork {
  final AppNetworkHelper _appNetworkHelper;

  ExpensesNetwork(AppNetworkHelper appNetworkHelper)
      : _appNetworkHelper = appNetworkHelper;
  Future<List<ExpenseModel>> getExpensesList(int dayId) async {
    var uri = AppEndPoints.generateUri(
        path: AppEndPoints.expenses, extra: 'day_id=eq.$dayId&select=*');
    try {
      final response = await _appNetworkHelper.get(uri);
      // Check if the response is successful
      if (response != null && response is List) {
        // Parse the response data into a list of maps
        List<Map<String, dynamic>> expenses =
            List<Map<String, dynamic>>.from(response);

        List<ExpenseModel> expenseItemModelList = expenses.map((item) {
          return ExpenseModel.fromJson(item);
        }).toList();

        return expenseItemModelList;
      } else {
        throw Exception('Failed to load expenses: $response');
      }
    } catch (e) {
      return [];
    }
  }

  Future<double> addExpense(ExpenseModel expenseItemModel) async {
    var uri = AppEndPoints.generateUri(path: AppEndPoints.expenses);
    // expenses?select=sum(amount)&day_id=eq.5
    try {
      await _appNetworkHelper.post(uri,
          data: json.encode(expenseItemModel.toJson()));
      return await getDayTotalExpenses(expenseItemModel.dayId);
      // Check if the response is successful
    } catch (e) {
      print('expenses_network > addExpense > error: e');
    }
    return 0;
  }

  Future<double> getDayTotalExpenses(int dayId) async {
    // expenses?select=sum(amount)&day_id=eq.5
    var getSumUri = AppEndPoints.generateUri(path: 'rpc/get_total_expenses');
    try {
      return await _appNetworkHelper.post(getSumUri,
          data: json.encode({"p_day_id": dayId}));
      // Check if the response is successful
    } catch (e) {
      print('expenses_network > addExpense > error: e');
    }
    return 0;
  }
}
