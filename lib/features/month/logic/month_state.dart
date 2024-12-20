import 'package:expenzo/features/month/data/models/month_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'month_state.freezed.dart';

@freezed
class MonthState with _$MonthState {
  const factory MonthState.initial() = _Initial;
  const factory MonthState.loading() = _Loading;
  const factory MonthState.loaded(MonthModel month) = _Loaded;
  const factory MonthState.error(String message) = _Error;
}
