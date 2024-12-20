// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'week_model.g.dart';

@JsonSerializable()
class WeekModel extends Equatable {
  @JsonKey(includeToJson: false)
  final int id;

  @JsonKey(name: 'week_number')
  final int weekNumber;

  @JsonKey(name: 'month_id', includeToJson: false, includeFromJson: true)
  final int monthId;

  @JsonKey(name: 'year_id', includeToJson: false, includeFromJson: true)
  final int? yearId;

  @JsonKey(name: 'total_spending')
  final double totalSpending;

  @JsonKey(name: 'essential_budget')
  final double essentialBudget;

  @JsonKey(name: 'fun_budget')
  final double funBudget;

  @JsonKey(name: 'start_date')
  final String startDate;

  @JsonKey(name: 'end_date')
  final String endDate;

  const WeekModel({
    required this.id,
    required this.weekNumber,
    required this.monthId,
    this.yearId,
    required this.totalSpending,
    required this.essentialBudget,
    required this.funBudget,
    required this.startDate,
    required this.endDate,
  });

  /// Factory constructor to create an empty instance of WeekModel.
  factory WeekModel.empty() => const WeekModel(
        id: 0,
        weekNumber: 0,
        monthId: 0,
        yearId: null,
        totalSpending: 0.0,
        essentialBudget: 0.0,
        funBudget: 0.0,
        startDate: '',
        endDate: '',
      );

  /// Factory constructor to create an instance from JSON.
  factory WeekModel.fromJson(Map<String, dynamic> json) =>
      _$WeekModelFromJson(json);

  /// Convert to a map, only including non-default values.
  Map<String, dynamic> toJson() {
    final emptyInstance = WeekModel.empty();

    return {
      if (id != emptyInstance.id) 'id': id,
      if (weekNumber != emptyInstance.weekNumber) 'week_number': weekNumber,
      if (monthId != emptyInstance.monthId) 'month_id': monthId,
      if (yearId != emptyInstance.yearId) 'year_id': yearId,
      if (totalSpending != emptyInstance.totalSpending)
        'total_spending': totalSpending,
      if (essentialBudget != emptyInstance.essentialBudget)
        'essential_budget': essentialBudget,
      if (funBudget != emptyInstance.funBudget) 'fun_budget': funBudget,
      if (startDate != emptyInstance.startDate) 'start_date': startDate,
      if (endDate != emptyInstance.endDate) 'end_date': endDate,
    };
  }

  @override
  List<Object?> get props => [
        id,
        weekNumber,
        monthId,
        yearId,
        totalSpending,
        essentialBudget,
        funBudget,
        startDate,
        endDate,
      ];

  WeekModel copyWith({
    int? id,
    int? weekNumber,
    int? monthId,
    int? yearId,
    double? totalSpending,
    double? essentialBudget,
    double? funBudget,
    String? startDate,
    String? endDate,
  }) {
    return WeekModel(
      id: id ?? this.id,
      weekNumber: weekNumber ?? this.weekNumber,
      monthId: monthId ?? this.monthId,
      yearId: yearId ?? this.yearId,
      totalSpending: totalSpending ?? this.totalSpending,
      essentialBudget: essentialBudget ?? this.essentialBudget,
      funBudget: funBudget ?? this.funBudget,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
