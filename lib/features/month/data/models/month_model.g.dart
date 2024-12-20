// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthModel _$MonthModelFromJson(Map<String, dynamic> json) => MonthModel(
      id: (json['id'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      yearId: (json['year_id'] as num).toInt(),
      totalSpending: (json['total_spending'] as num).toDouble(),
      essentialBudget: (json['essential_budget'] as num).toDouble(),
      funBudget: (json['fun_budget'] as num).toDouble(),
      weeklyFunBudget: (json['weekly_fun_budget'] as num).toDouble(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
    );

Map<String, dynamic> _$MonthModelToJson(MonthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'month': instance.month,
      'total_spending': instance.totalSpending,
      'essential_budget': instance.essentialBudget,
      'fun_budget': instance.funBudget,
      'weekly_fun_budget': instance.weeklyFunBudget,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
