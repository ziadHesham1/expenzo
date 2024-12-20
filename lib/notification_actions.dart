import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void showNotificationWithActions(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'test_channel_id', // Channel ID
    'Test Channel', // Channel Name
    importance: Importance.max,
    priority: Priority.high,
    actions: <AndroidNotificationAction>[
      AndroidNotificationAction(
        'action_1', // Action ID
        'Option 1', // Action Label
        showsUserInterface: true,
      ),
      AndroidNotificationAction(
        'action_2', // Action ID
        'Option 2', // Action Label
        showsUserInterface: true,
      ),
      AndroidNotificationAction(
        showsUserInterface: true,

        'reply', // Action ID
        'Reply', // Action Label
        icon: null,
        allowGeneratedReplies: true,
        inputs: <AndroidNotificationActionInput>[
          AndroidNotificationActionInput(
            label: 'Type your reply here', // Label shown in the input field
            allowFreeFormInput: true, // Allows free text input
          ),
        ],
      ),
      AndroidNotificationAction(
        'dismiss', // Action ID
        'Dismiss', // Action Label
      ),
    ],
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    'Test Notification', // Title
    'This is a test notification with actions.', // Body
    platformChannelSpecifics,
    payload: 'test_payload', // Optional payload
  );
}
