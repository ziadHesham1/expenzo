import 'package:expenzo/features/days/data/models/day_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/budget/budget_model.dart';

enum SummeryType { remaining, spent }

extension SummeryTypeExtension on SummeryType {
  MaterialColor get themeColor {
    switch (this) {
      case SummeryType.remaining:
        return Colors.green;
      case SummeryType.spent:
        return Colors.red;
    }
  }

  TextStyle get getTextStyle {
    switch (this) {
      case SummeryType.remaining:
        return TextStyle(
          color: Colors.green,
          fontSize: 12.sp,
        );
      case SummeryType.spent:
        return TextStyle(
          color: Colors.red,
          fontSize: 12.sp,
        );
    }
  }

  String get getIcon {
    switch (this) {
      case SummeryType.remaining:
        return 'assets/images/payment.png';
      case SummeryType.spent:
        return 'assets/images/spending.png';
    }
  }

  String get getTitle {
    switch (this) {
      case SummeryType.remaining:
        return 'Remaining';
      case SummeryType.spent:
        return 'Spent';
    }
  }
}

class SummeryWidget extends StatelessWidget {
  final DayModel budget;
  const SummeryWidget({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        children: [
          summeryCard(SummeryType.remaining),
          SizedBox(width: 10.w),
          summeryCard(SummeryType.spent),
        ],
      ),
    );
  }

  Widget summeryCard(SummeryType summeryType) {
    return Expanded(
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            imageContainer(summeryType),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summeryType.getTitle,
                  style: summeryType.getTextStyle,
                ),
                SizedBox(height: 2.h),
                Text(
                  SummeryType.remaining == summeryType
                      ? (budget.dailyLimit - budget.totalSpending).toString()
                      : budget.totalSpending.toString(),
                  style: TextStyle(
                    // color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget imageContainer(SummeryType summeryType) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: summeryType.themeColor.shade50,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          summeryType.getIcon,
          height: 30.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
