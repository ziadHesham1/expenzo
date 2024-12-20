import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di.dart';
import '../../budget/data/models/expense_item_model.dart';
import '../../budget/data/network/expenses_network.dart';
import '../../settings/data/network/settings_network.dart';
import '../../week/data/network/week_network.dart';
import '../data/models/day_model.dart';
import '../data/networks/day_network.dart';
import 'day_state.dart';

class TodayCubit extends Cubit<TodayState> {
  TodayCubit() : super(const TodayState.initial());

  getTodayData() async {
    emit(const TodayState.loading());
    DayModel? response = await getIt<DayNetwork>().getTodayData();
    if (response == null) {
      createTodayRecord();
      return;
    }
    emit(TodayState.loaded(today: response));
  }

  createTodayRecord() async {
    emit(const TodayState.loading());

    double dailyLimit = await getIt<SettingsNetwork>()
        .getSettings()
        .then((value) => value.dailyBudget);
    await getIt<DayNetwork>().createTodayRecord(
      dailyLimit: dailyLimit,
    );
    await getTodayData();
  }

  addExpense(ExpenseModel expense) async {
    // emit(const TodayState.loading());
    double total = await getIt<ExpensesNetwork>().addExpense(expense);
    await getIt<DayNetwork>().updateTodayTotalSpending(total);
    DayModel? todayData = (state as Loaded).today;
    if (todayData != null) {
      await getIt<WeekNetwork>().updateWeekTotalSpending(todayData.weekId);
    }

    await getTodayData();
  }

  getTodaysExpenses() async {
    DayModel? todayData = (state as Loaded).today;
    if (todayData != null) {
      var result = await getIt<ExpensesNetwork>().getExpensesList(todayData.id);
      emit(TodayState.loaded(today: todayData, expenses: result));
    }
  }
}
