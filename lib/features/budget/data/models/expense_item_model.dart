import 'package:expenzo/core/extensions/date_extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_item_model.g.dart';

@JsonSerializable()
class ExpenseModel {
  @JsonKey(includeFromJson: true, includeToJson: false)
  final int id; // Make id optional

  @JsonKey(name: 'day_id')
  final int dayId;

  final double amount;
  final String description;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  ExpenseModel({
    this.id = -1,
    this.dayId = -1,
    required this.amount,
    required this.description,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);
}
