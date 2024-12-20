import 'package:expenzo/features/budget/presentation/screens/spending_screen.dart';
import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'features/settings/settings_screen.dart';
import 'features/transactions/transactions_screen.dart';

class AppNavbar extends StatefulWidget {
  const AppNavbar({super.key});

  @override
  State<AppNavbar> createState() => _AppNavbarState();
}

class _AppNavbarState extends State<AppNavbar> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screens = [
      const SpendingScreen(),
      const TransactionsScreen(),
      const SettingsScreen(),
    ];
    var tabs = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: 'Transactions',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];
    return Scaffold(
        body: screens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
          backgroundColor: const Color(0xffff6f6f6),
          selectedItemColor: AppColors.primary,
          onTap: (value) {
            setState(() {
              tabIndex = value;
            });
          },
          items: tabs,
        ));
  }
}
