import 'package:flutter_bloc/flutter_bloc.dart';

import 'month_state.dart';

class MonthCubit extends Cubit<MonthState> {
  MonthCubit() : super(const MonthState.initial());
}
