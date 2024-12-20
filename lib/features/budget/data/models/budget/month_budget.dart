// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';

import '../spending_model.dart';
import '../spent_item_model.dart';
import 'budget_model.dart';
import 'day_budget.dart';

// ignore: must_be_immutable
class MonthBudgetModel extends BudgetModel {
  final List<DayBudgetModel> days;

  MonthBudgetModel({
    required super.total,
    required this.days,
  }) : super(spending: _monthTotalSpending(days));

  factory MonthBudgetModel.empty() {
    return MonthBudgetModel(
      total: 0,
      days: const [],
    );
  }

  static _monthTotalSpending(List<DayBudgetModel> days) {
    int total = 0;
    for (var day in days) {
      total += day.spending.total;
    }

    return SpendingModel(totalAmount: total, items: const []);
  }

  DayBudgetModel get getTodayBudget {
    DateTime today = DateTime.now();
    DayBudgetModel? todayBudget =
        days.firstWhereOrNull((day) => day.date == today);
    if (todayBudget == null) {
      return DayBudgetModel(
        date: DateTime.now(),
        spending: SpendingModel.empty(),
        total: 0,
      );
    }
    return todayBudget;
  }

  MonthBudgetModel updateTodayBudget(DayBudgetModel dayBudget) {
    days.removeWhere((day) => day.date == dayBudget.date);
    days.add(dayBudget);
    return this;
  }

  @override
  List<Object> get props => [days, total];
  MonthBudgetModel copyWith({
    List<DayBudgetModel>? days,
    int? total,
  }) {
    return MonthBudgetModel(
      days: days ?? this.days,
      total: total ?? this.total,
    );
  }
}

var _twoDaysAgo = DateTime.now().subtract(const Duration(days: 2));
var _yesterday = DateTime.now().subtract(const Duration(days: 1));
final dummDaysList = [
  DayBudgetModel(
    date: _yesterday,
    spending: SpendingModel(
      items: [
        SpentItemModel(
          name: 'Groceries',
          amount: 100,
          date: _yesterday,
        ),
        SpentItemModel(
          name: 'eccc',
          amount: 60,
          date: _yesterday,
        ),
      ],
    ),
    total: 2000,
  ),
  DayBudgetModel(
    date: _twoDaysAgo,
    spending: SpendingModel(
      items: [
        SpentItemModel(
          name: 'Groceries',
          amount: 60,
          date: _twoDaysAgo,
        ),
        SpentItemModel(
          name: 'eccc',
          amount: 23,
          date: _twoDaysAgo,
        ),
      ],
    ),
    total: 2000,
  ),
];
