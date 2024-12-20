// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    SettingsModel(
      totalBudget: (json['total_budget'] as num).toDouble(),
      dailyBudget: (json['daily_budget'] as num).toDouble(),
    );

Map<String, dynamic> _$SettingsModelToJson(SettingsModel instance) =>
    <String, dynamic>{
      'total_budget': instance.totalBudget,
      'daily_budget': instance.dailyBudget,
    };
