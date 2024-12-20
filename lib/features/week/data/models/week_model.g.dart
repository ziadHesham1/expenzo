// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeekModel _$WeekModelFromJson(Map<String, dynamic> json) => WeekModel(
      id: (json['id'] as num).toInt(),
      weekNumber: (json['week_number'] as num).toInt(),
      monthId: (json['month_id'] as num).toInt(),
      yearId: (json['year_id'] as num?)?.toInt(),
      totalSpending: (json['total_spending'] as num).toDouble(),
      essentialBudget: (json['essential_budget'] as num).toDouble(),
      funBudget: (json['fun_budget'] as num).toDouble(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
    );

Map<String, dynamic> _$WeekModelToJson(WeekModel instance) => <String, dynamic>{
      'week_number': instance.weekNumber,
      'total_spending': instance.totalSpending,
      'essential_budget': instance.essentialBudget,
      'fun_budget': instance.funBudget,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
