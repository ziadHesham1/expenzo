// import 'package:expenzo/notification_actions.dart';
// import 'package:expenzo/notification_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize local notifications
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       await NotificationHelper.init();

//   runApp(
//       MyApp(flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin));
// }

// class MyApp extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   const MyApp({super.key, required this.flutterLocalNotificationsPlugin});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Local Notification Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: NotificationTestScreen(
//         flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
//       ),
//     );
//   }
// }

// class NotificationTestScreen extends StatefulWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   const NotificationTestScreen(
//       {super.key, required this.flutterLocalNotificationsPlugin});

//   @override
//   State<NotificationTestScreen> createState() => _NotificationTestScreenState();
// }

// class _NotificationTestScreenState extends State<NotificationTestScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notification Tester'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 showNotificationWithActions(
//                     widget.flutterLocalNotificationsPlugin);
//               },
//               child: const Text('Show Notification with Actions'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {});
//               },
//               child: const Text('refresh'),
//             ),
//             ...inputs.map((e) => Text(e))
//           ],
//         ),
//       ),
//     );
//   }
// }
