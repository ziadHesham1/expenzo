// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayModel _$DayModelFromJson(Map<String, dynamic> json) => DayModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      date: DateTime.parse(json['date'] as String),
      totalSpending: (json['total_spending'] as num).toDouble(),
      monthId: (json['month_id'] as num?)?.toInt() ?? -1,
      dayOfWeek: (json['day_of_week'] as num).toInt(),
      dailyLimit: (json['daily_limit'] as num).toDouble(),
      weekId: (json['week_id'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$DayModelToJson(DayModel instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'total_spending': instance.totalSpending,
      'day_of_week': instance.dayOfWeek,
      'daily_limit': instance.dailyLimit,
    };
