import 'package:equatable/equatable.dart';
import 'package:expenzo/core/extensions/date_extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_model.g.dart';

@JsonSerializable()
class DayModel extends Equatable {
  @JsonKey(includeFromJson: true, includeToJson: false)
  final int id;
  final DateTime date;
  @JsonKey(name: 'total_spending')
  final double totalSpending;
  @JsonKey(includeFromJson: true, includeToJson: false, name: 'month_id')
  final int monthId;
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;
  @JsonKey(name: 'daily_limit')
  final double dailyLimit;
  @JsonKey(includeFromJson: true, includeToJson: false, name: 'week_id')
  final int weekId;

  const DayModel({
    this.id = -1,
    required this.date,
    required this.totalSpending,
    this.monthId = -1,
    required this.dayOfWeek,
    required this.dailyLimit,
    this.weekId = -1,
  });

  factory DayModel.empty() => DayModel(
        id: -1,
        date: DateTime(500),
        totalSpending: 0.0,
        monthId: -1,
        dayOfWeek: 0,
        dailyLimit: 0.0,
        weekId: -1,
      );

  factory DayModel.fromJson(Map<String, dynamic> json) =>
      _$DayModelFromJson(json);

  Map<String, dynamic> toJson() {
    final emptyInstance = DayModel.empty();

    return {
      if (id != emptyInstance.id) 'id': id,
      if (date != emptyInstance.date) 'date': date.toServerFormat,
      if (totalSpending != emptyInstance.totalSpending)
        'total_spending': totalSpending,
      if (monthId != emptyInstance.monthId) 'month_id': monthId,
      if (dayOfWeek != emptyInstance.dayOfWeek) 'day_of_week': dayOfWeek,
      if (dailyLimit != emptyInstance.dailyLimit) 'daily_limit': dailyLimit,
      if (weekId != emptyInstance.weekId) 'week_id': weekId,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      date,
      totalSpending,
      monthId,
      dayOfWeek,
      dailyLimit,
      weekId,
    ];
  }

  DayModel copyWith({
    int? id,
    DateTime? date,
    double? totalSpending,
    int? monthId,
    int? dayOfWeek,
    double? dailyLimit,
    int? weekId,
  }) {
    return DayModel(
      id: id ?? this.id,
      date: date ?? this.date,
      totalSpending: totalSpending ?? this.totalSpending,
      monthId: monthId ?? this.monthId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      dailyLimit: dailyLimit ?? this.dailyLimit,
      weekId: weekId ?? this.weekId,
    );
  }
}
