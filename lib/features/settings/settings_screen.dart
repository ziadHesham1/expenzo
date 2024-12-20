import 'package:expenzo/core/app_colors.dart';
import 'package:expenzo/features/settings/logic/settings_logic_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_text_field.dart';
import '../../core/di.dart';
import 'data/models/settings_model.dart';
import 'data/network/settings_network.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var newSettings = SettingsModel.empty();
  get dataChanged {
    return newSettings != SettingsModel.empty();
  }

  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            onPressed: onSaved,
            icon: const Icon(Icons.save, color: AppColors.primary),
          )
        ],
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => Container(),
              loaded: (settingsData) {
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        AppTextField(
                          labelText: 'Your Budget',
                          initialValue: settingsData.totalBudget.toString(),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            print(
                                'value = $value , settingsData.totalBudget = ${settingsData.totalBudget.toString()}');
                            if (value != null && value.isNotEmpty) {
                              setState(() {
                                newSettings = newSettings.copyWith(
                                  totalBudget: double.parse(value),
                                );
                              });
                            }
                          },
                        ),
                        AppTextField(
                          labelText: 'Your Daily Budget',
                          initialValue: settingsData.dailyBudget.toString(),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            if (value != null && value.isNotEmpty) {
                              setState(() {
                                newSettings = newSettings.copyWith(
                                  dailyBudget: double.parse(value),
                                );
                              });
                            }
                          },
                        ),
                        const Divider(),
                        FutureBuilder(
                            future: getIt<SettingsNetwork>().getSettings(),
                            builder: (context, snapshot) {
                              SettingsModel? settings = snapshot.data;
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting ||
                                  settings == null) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              return Column(
                                children: [
                                  _transactionText(
                                      'total =${settings.totalBudget} EGP'),
                                  _transactionText(
                                      'dailyLimit =${settings.dailyBudget} EGP'),
                                  _transactionText(
                                      'essential budget =${settings.essentialBudget} EGP'),
                                  _transactionText(
                                      'Weekly Essential Budget =${settings.weeklyEssentialBudget.toStringAsFixed(2)} EGP'),
                                  _transactionText(
                                      'fun budget=${settings.funBudget} EGP'),
                                  _transactionText(
                                      'Weekly Fun Budget=${settings.weeklyFunBudget.toStringAsFixed(2)} EGP'),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  void onSaved() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<SettingsCubit>().updateSetting(newSettings);
    }
  }

  Widget _transactionText(String text) {
    return Text(text,
        style: const TextStyle(
          fontSize: 20,
          // fontWeight: FontWeight.bold,
        ));
  }
}
