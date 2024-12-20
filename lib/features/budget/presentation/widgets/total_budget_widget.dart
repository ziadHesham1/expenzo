import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/money_text_widget.dart';
import '../../../days/data/models/day_model.dart';

class TotalBudgetWidget extends StatelessWidget {
  const TotalBudgetWidget({
    super.key,
    required this.day,
  });

  final DayModel day;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Budget',
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 2.h),
        MoneyTextWidget(
          value: day.dailyLimit,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
