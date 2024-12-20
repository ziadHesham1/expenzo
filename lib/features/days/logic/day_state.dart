import 'package:expenzo/features/budget/data/models/expense_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/day_model.dart';

part 'day_state.freezed.dart';

@freezed
class TodayState with _$TodayState {
  const factory TodayState.initial() = _Initial;
  const factory TodayState.loading() = _Loading;
  const factory TodayState.loaded(
      {DayModel? today, List<ExpenseModel>? expenses}) = Loaded;
  const factory TodayState.addExpense() = addExpense;
  const factory TodayState.error({required String message}) = _Error;
}
