import 'package:expenzo/core/di.dart';
import 'package:expenzo/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expenzo/notification_actions.dart';

import 'my_app.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  await DependencyInjection().registerSingleton();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      await NotificationHelper.init();
  showNotificationWithActions(flutterLocalNotificationsPlugin);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => const MyApp(),
    ),
  );
}
