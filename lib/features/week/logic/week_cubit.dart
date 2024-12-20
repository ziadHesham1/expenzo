import 'package:expenzo/core/di.dart';
import 'package:expenzo/features/week/data/models/week_model.dart';
import 'package:expenzo/features/week/data/network/week_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'week_state.dart';

class WeekCubit extends Cubit<WeekState> {
  WeekCubit() : super(const WeekState.initial());

  Future<void> getWeek() async {
    emit(const WeekState.loading());

    try {
      WeekModel? result = await getIt<WeekNetwork>().getWeekData();
      if (result == null) {
        emit(const WeekState.error('Failed to load week data'));
      } else {
        emit(WeekState.loaded(result));
      }
    } catch (e) {
      emit(WeekState.error(e.toString()));
    }
  }
}
