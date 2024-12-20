import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'day_budget_state.dart';

class DayBudgetCubit extends Cubit<DayBudgetState> {
  DayBudgetCubit() : super(DayBudgetState.initial());
}
