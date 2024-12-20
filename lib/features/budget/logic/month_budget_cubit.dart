import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/budget/day_budget.dart';
import '../data/models/budget/month_budget.dart';
import '../data/models/spent_item_model.dart';

part 'month_budget_state.dart';

class MonthBudgetCubit extends Cubit<MonthBudgetState> {
  MonthBudgetCubit() : super(MonthBudgetState.initial());

  updateTotalBudget(int totalBudget) {
    emit(state.updateTotalBudget(totalBudget));
  }

  updateDayBudgetLimit(int dayBudgetLimit) {
    emit(state.updateDayBudgetLimit(dayBudgetLimit));
  }

  onSpending(SpentItemModel spending) {
    DayBudgetModel updatedDayBudget = state.monthBudgetModel.getTodayBudget
        .addSpending(spending) as DayBudgetModel;

    emit(state.updateTodayBudget(updatedDayBudget));
  }
}
