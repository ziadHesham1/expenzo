import 'package:expenzo/features/budget/presentation/widgets/amount_options_widget.dart';
import 'package:expenzo/features/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../days/data/models/day_model.dart';
import '../../../days/logic/day_cubit.dart';
import '../../../days/logic/day_state.dart';
import '../../data/models/expense_item_model.dart';
import '../widgets/spending_chip.dart';
import '../widgets/spending_chip_widget.dart';
import '../widgets/summery_widget.dart';
import '../widgets/total_budget_widget.dart';

class SpendingScreen extends StatefulWidget {
  const SpendingScreen({super.key});

  @override
  State<SpendingScreen> createState() => _SpendingScreenState();
}

class _SpendingScreenState extends State<SpendingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodayCubit>().getTodayData();
  }

  String selectedLabel = 'عشوائي';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayCubit, TodayState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (DayModel? todayData, _) {
            if (todayData == null) {
              return const Center(child: Text('no data'));
            }
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TotalBudgetWidget(day: todayData),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HistoryScreen(),
                                ));
                              },
                              icon: const Icon(Icons.history),
                            )
                          ],
                        ),
                        SizedBox(height: 14.h),
                        SummeryWidget(budget: todayData),
                        SizedBox(height: 14.h),
                        LabelsOptionsWidget(
                          chip: labelsList,
                          initValue: selectedLabel,
                          onChanged: (val) {
                            selectedLabel = val;
                            setState(() {});
                          },
                        ),
                        AmountOptionsWidget(
                          chip: pricesList,
                          onChanged: (val) {
                            context.read<TodayCubit>().addExpense(
                                  ExpenseModel(
                                    dayId: todayData.id,
                                    description: selectedLabel,
                                    amount: val,
                                  ),
                                );
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
