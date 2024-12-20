// Cubit to manage a list of user inputs
import 'package:flutter_bloc/flutter_bloc.dart';

class InputCubit extends Cubit<List<String>> {
  InputCubit() : super([]);

  void addInput(String input) {
    final updatedList = List<String>.from(state)..add(input);
    print('notification inputs =  $updatedList');
    emit(updatedList);
  }
}
