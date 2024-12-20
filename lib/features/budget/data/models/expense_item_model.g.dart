// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) => ExpenseModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      dayId: (json['day_id'] as num?)?.toInt() ?? -1,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ExpenseModelToJson(ExpenseModel instance) =>
    <String, dynamic>{
      'day_id': instance.dayId,
      'amount': instance.amount,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
    };
