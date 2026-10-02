import 'package:flutter_local_notifications/flutter_local_notifications.dart';

enum ReminderKind { dailyMeal, bill, monthEnd, backup }

class ReminderService {
  ReminderService(this._plugin);
  final FlutterLocalNotificationsPlugin _plugin;
  Future<bool> initialize() async =>
      (await _plugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
        ),
      )) ??
      false;
  Future<bool> requestPermission() async =>
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission() ??
      true;
  Future<void> scheduleDailyMeal({
    required int hour,
    required int minute,
    required bool isMealComplete,
  }) async {
    if (isMealComplete) return cancel(ReminderKind.dailyMeal);
    await _plugin.periodicallyShow(
      ReminderKind.dailyMeal.index,
      'Meal entry reminder',
      'Record today\'s meals',
      RepeatInterval.daily,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'meals',
          'Meal reminders',
          channelDescription: 'Daily meal entry reminders',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  Future<void> scheduleSimple(ReminderKind kind, String title, String body) =>
      _plugin.show(
        kind.index,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'mess_manager',
            'Mess Manager reminders',
          ),
        ),
      );
  Future<void> cancel(ReminderKind kind) => _plugin.cancel(kind.index);
  Future<void> cancelAll() => _plugin.cancelAll();
}
