// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/extensions/date_extensions.dart';
part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel extends Equatable {
  @JsonKey(name: 'total_budget')
  final double totalBudget;
  @JsonKey(name: 'daily_budget')
  final double dailyBudget;

  const SettingsModel({
    required this.totalBudget,
    required this.dailyBudget,
  });

  factory SettingsModel.empty() {
    return const SettingsModel(
      totalBudget: 0,
      dailyBudget: 0,
    );
  }
//
  double get weeklyFunBudget {
    var budget = funBudget;
    var monthRemainingWeeks2 = DateTime.now().monthRemainingWeeks;
    return (budget / monthRemainingWeeks2);
  }

  double get weeklyEssentialBudget {
    var budget = essentialBudget;
    var monthRemainingWeeks2 = DateTime.now().monthRemainingWeeks;
    return (budget / monthRemainingWeeks2);
  }

  double get funBudget {
    var funBudget = totalBudget - essentialBudget;
    return funBudget;
  }

  double get essentialBudget {
    var monthRemainingDays2 = DateTime.now().monthRemainingDays;
    var essentialBudget = dailyBudget * monthRemainingDays2;
    return essentialBudget;
  }

  @override
  List<Object> get props {
    return [
      totalBudget,
      dailyBudget,
      essentialBudget,
      funBudget,
      weeklyFunBudget,
    ];
  }

  SettingsModel copyWith({
    double? totalBudget,
    double? dailyBudget,
  }) {
    return SettingsModel(
      totalBudget: totalBudget ?? this.totalBudget,
      dailyBudget: dailyBudget ?? this.dailyBudget,
    );
  }

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}
