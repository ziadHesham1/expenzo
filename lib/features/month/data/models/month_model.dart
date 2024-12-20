// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'month_model.g.dart';

@JsonSerializable()
class MonthModel extends Equatable {
  final int id;

  final int month;

  @JsonKey(name: 'year_id', includeFromJson: true, includeToJson: false)
  final int yearId;

  @JsonKey(name: 'total_spending')
  final double totalSpending;

  @JsonKey(name: 'essential_budget')
  final double essentialBudget;

  @JsonKey(name: 'fun_budget')
  final double funBudget;

  @JsonKey(name: 'weekly_fun_budget')
  final double weeklyFunBudget;

  @JsonKey(name: 'start_date')
  final String startDate;

  @JsonKey(name: 'end_date')
  final String endDate;

  const MonthModel({
    required this.id,
    required this.month,
    required this.yearId,
    required this.totalSpending,
    required this.essentialBudget,
    required this.funBudget,
    required this.weeklyFunBudget,
    required this.startDate,
    required this.endDate,
  });
  factory MonthModel.empty() => const MonthModel(
        id: -1,
        month: -1,
        yearId: -1,
        totalSpending: 0.0,
        essentialBudget: 0.0,
        funBudget: 0.0,
        weeklyFunBudget: 0.0,
        startDate: '',
        endDate: '',
      );
  factory MonthModel.fromJson(Map<String, dynamic> json) =>
      _$MonthModelFromJson(json);

  Map<String, dynamic> toJson() {
    final emptyInstance = MonthModel.empty();

    return {
      if (id != emptyInstance.id) 'id': id,
      if (month != emptyInstance.month) 'month': month,
      if (yearId != emptyInstance.yearId) 'year_id': yearId,
      if (totalSpending != emptyInstance.totalSpending)
        'total_spending': totalSpending,
      if (essentialBudget != emptyInstance.essentialBudget)
        'essential_budget': essentialBudget,
      if (funBudget != emptyInstance.funBudget) 'fun_budget': funBudget,
      if (weeklyFunBudget != emptyInstance.weeklyFunBudget)
        'weekly_fun_budget': weeklyFunBudget,
      if (startDate != emptyInstance.startDate) 'start_date': startDate,
      if (endDate != emptyInstance.endDate) 'end_date': endDate,
    };
  }

  @override
  List<Object?> get props => [
        id,
        month,
        yearId,
        totalSpending,
        essentialBudget,
        funBudget,
        weeklyFunBudget,
        startDate,
        endDate,
      ];

  MonthModel copyWith({
    int? id,
    int? month,
    int? yearId,
    double? totalSpending,
    double? essentialBudget,
    double? funBudget,
    double? weeklyFunBudget,
    String? startDate,
    String? endDate,
  }) {
    return MonthModel(
      id: id ?? this.id,
      month: month ?? this.month,
      yearId: yearId ?? this.yearId,
      totalSpending: totalSpending ?? this.totalSpending,
      essentialBudget: essentialBudget ?? this.essentialBudget,
      funBudget: funBudget ?? this.funBudget,
      weeklyFunBudget: weeklyFunBudget ?? this.weeklyFunBudget,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
