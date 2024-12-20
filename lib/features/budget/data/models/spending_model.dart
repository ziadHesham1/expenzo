// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:expenzo/features/budget/data/models/spent_item_model.dart';

class SpendingModel extends Equatable {
  final int total;
  final List<SpentItemModel> items;
  SpendingModel({
    required this.items,
    int? totalAmount,
  }) : total = totalAmount ?? items.fold(0, (sum, item) => sum + item.amount);

  factory SpendingModel.empty() {
    return SpendingModel(items: const []);
  }
  SpendingModel addSpending(SpentItemModel spending) {
    return SpendingModel(
      items: [...items, spending],
      totalAmount: total + spending.amount,
    );
  }

  @override
  List<Object> get props => [items, total];
}
