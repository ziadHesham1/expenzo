part of 'month_budget_cubit.dart';

class MonthBudgetState extends Equatable {
  final MonthBudgetModel monthBudgetModel;

  const MonthBudgetState({
    required this.monthBudgetModel,
  });
  factory MonthBudgetState.initial() {
    return MonthBudgetState(
      monthBudgetModel: MonthBudgetModel.empty().copyWith(days: dummDaysList),
    );
  }
  updateTotalBudget(int total) {
    return copyWith(
      monthBudgetModel: monthBudgetModel.copyWith(total: total),
    );
  }

  updateDayBudgetLimit(int limit) {
    return updateTodayBudget(
        monthBudgetModel.getTodayBudget.copyWith(total: limit));
  }

  updateTodayBudget(DayBudgetModel dayBudget) {
    MonthBudgetModel updateTodayBudget =
        monthBudgetModel.updateTodayBudget(dayBudget);

    return copyWith(
      monthBudgetModel: updateTodayBudget,
    );
  }

  copyWith({MonthBudgetModel? monthBudgetModel}) {
    return MonthBudgetState(
      monthBudgetModel: monthBudgetModel ?? this.monthBudgetModel,
    );
  }

  @override
  List<Object> get props => [monthBudgetModel];
}
