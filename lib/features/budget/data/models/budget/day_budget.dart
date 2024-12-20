import 'package:expenzo/features/budget/data/models/spending_model.dart';
import 'package:expenzo/features/budget/data/models/spent_item_model.dart';

import 'budget_model.dart';

class DayBudgetModel extends BudgetModel {
  DayBudgetModel({
    required super.total,
    super.spending,
    super.remaining,
    super.date,
  });

  factory DayBudgetModel.empty() => DayBudgetModel(
      total: 0,
      spending: SpendingModel(items: const [], totalAmount: 0),
      remaining: 0);
  @override
  addSpending(SpentItemModel spendingItem) {
    return BudgetModel(
      total: total + spendingItem.amount,
      spending: spending.addSpending(spendingItem),
      remaining: remaining - spendingItem.amount,
    );
  }

  copyWith({
    int? total,
    SpendingModel? spending,
    int? remaining,
  }) {
    return DayBudgetModel(
      total: total ?? this.total,
      spending: spending ?? this.spending,
      remaining: remaining ?? this.remaining,
    );
  }
}
