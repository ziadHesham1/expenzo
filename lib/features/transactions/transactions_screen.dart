import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di.dart';
import '../../core/extensions/date_extensions.dart';
import '../days/data/models/day_model.dart';
import '../days/data/networks/day_network.dart';
import '../week/logic/week_cubit.dart';
import '../week/logic/week_state.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeekCubit>().getWeek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: BlocBuilder<WeekCubit, WeekState>(
        builder: (context, state) {
          // var settingsState = context.read<SettingsCubit>().state;
          // double? totalBudget = settingsState.mapOrNull(
          //   loaded: (value) => value.settings.totalBudget,
          // );
          return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => Container(),
              loaded: (budget) {
                return Column(
                  children: [
                    // _transactionText('total =${budget.totalSpending} EGP'),
                    _transactionText('total =${budget.essentialBudget} EGP'),
                    _transactionText(
                        'remaining =${budget.essentialBudget - budget.totalSpending} EGP'),
                    _transactionText('spending =${budget.totalSpending} EGP'),
                    const Divider(),
                    FutureBuilder(
                        future: getIt<DayNetwork>().fetchDaysByWeekId(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          var data = snapshot.data;

                          return Column(
                            children:
                                data!.map((day) => newMethod(day)).toList(),
                          );
                        })
                  ],
                );
              });
        },
      ),
    );
  }

  Widget newMethod(DayModel day) {
    return ListTile(
      title: Text('spent: ${day.totalSpending}',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 20,
            color:
                day.dailyLimit < day.totalSpending ? Colors.red : Colors.green,
          )),
      subtitle: Text('limit: ${day.dailyLimit}',
          style: const TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
      trailing: Text(
        day.date.toDayNameDateFormat,
        style: const TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _transactionText(String text) {
    return Text(text,
        style: const TextStyle(
          fontSize: 20,
          // fontWeight: FontWeight.bold,
        ));
  }
}
