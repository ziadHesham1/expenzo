import 'package:expenzo/features/week/data/models/week_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'week_state.freezed.dart';

@freezed
class WeekState with _$WeekState {
  const factory WeekState.initial() = _Initial;
  const factory WeekState.loading() = _Loading;
  const factory WeekState.loaded(WeekModel week) = _Loaded;
  const factory WeekState.error(String message) = _Error;
}
