import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'budget/data/models/expense_item_model.dart';
import 'days/logic/day_cubit.dart';
import 'days/logic/day_state.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodayCubit>().getTodaysExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: BlocBuilder<TodayCubit, TodayState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => const Center(child: Text('no data')),
            loaded: (_, List<ExpenseModel>? expenses) {
              if (expenses == null) {
                return const Center(child: Text('no data'));
              }
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...expenses.map(
                        (expense) => ListTile(
                          title: Text(expense.amount.toString(),
                              style: const TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          subtitle: Text(expense.description,
                              style: const TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          trailing: Text(
                            expense.createdAt.toString(),
                            style: const TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
