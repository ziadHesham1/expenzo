import 'package:flutter_local_notifications/flutter_local_notifications.dart';

List<String> inputs = [];

class NotificationHelper {
  // Top-level function for background notification handling
  @pragma(
      'vm:entry-point') // This annotation is required for background callbacks
  static notificationTapBackground(NotificationResponse notificationResponse) {
    // Handle the background notification tap
    print('notification - background > payload = $notificationResponse');
  }

  static Future<FlutterLocalNotificationsPlugin> init() async {
    // Initialize local notifications
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
        onDidReceiveNotificationResponse: onNotificationTap);
    return flutterLocalNotificationsPlugin;
  }

  static void onNotificationTap(NotificationResponse payload) async {
    if (payload.input != null) {
      inputs.add(payload.input!);
    } else if (payload.actionId != null) {
      inputs.add(payload.actionId!);
    }
  }
}
