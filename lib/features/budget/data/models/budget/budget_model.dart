import 'package:equatable/equatable.dart';

import '../spending_model.dart';
import '../spent_item_model.dart';

class BudgetModel extends Equatable {
  final int total;

  final SpendingModel spending;
  final int remaining;
  final DateTime date;
  BudgetModel({
    DateTime? date,
    required this.total,
    SpendingModel? spending,
    int? remaining,
  })  : remaining = remaining ?? total - (spending?.total ?? 0),
        spending = spending ?? SpendingModel(items: const [], totalAmount: 0),
        date = date ?? DateTime.now();

  factory BudgetModel.empty() => BudgetModel(
      total: 0,
      spending: SpendingModel(items: const [], totalAmount: 0),
      remaining: 0);

  addSpending(SpentItemModel spendingItem) {
    return BudgetModel(
      total: total + spendingItem.amount,
      spending: spending.addSpending(spendingItem),
      remaining: remaining - spendingItem.amount,
    );
  }

  @override
  List<Object> get props => [total, spending, remaining];

  @override
  toString() =>
      'BudgetModel(total: $total, spending: $spending, remaining: $remaining, date: $date)';
}
