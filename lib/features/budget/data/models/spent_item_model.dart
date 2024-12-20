// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SpentItemModel extends Equatable {
  final String name;
  final int amount;
  final DateTime date;
  SpentItemModel({
    required this.name,
    required this.amount,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  @override
  List<Object> get props => [name, amount, date];
}
