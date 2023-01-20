import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class NotificationController {
  static ReceivedAction? initialAction;

  ///  *********************************************
  ///     INITIALIZATIONS
  ///  *********************************************
  ///
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        // 'assets://assets/notification',
        null, //'resource://drawable/res_app_icon',//
        [
          NotificationChannel(
              channelKey: 'alerts',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.High,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple)
        ],
        debug: true);

    // Get initial notification action is optional
    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS LISTENER
  ///  *********************************************
  ///  Notifications events are only delivered after call this method
  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  static Future<bool> notificationsAllowed() async {
    return await AwesomeNotifications().isNotificationAllowed();
  }

  ///  *********************************************
  ///     NOTIFICATION EVENTS
  ///  *********************************************
  ///
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
        return;
  }

  ///  *********************************************
  ///     NOTIFICATION CREATION METHODS
  ///  *********************************************
  ///
  ///
  static Future<void> createNewNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    // if (!isAllowed) isAllowed = await AwesomeNotifications().requestPermissionToSendNotifications();
    if (!isAllowed) return;

  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1,
          channelKey: 'alerts',
          title: 'Remember to breathe out',
          // body: '',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/not.png',
          largeIcon: 'asset://assets/not.png',),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(const Duration(seconds: 49020)), repeats: true));
      // schedule: NotificationInterval(interval: 41820, timeZone: localTimeZone, repeats: true));
      // 13 hours 37 minutes
  
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1,
          channelKey: 'alerts',
          title: 'Remember to breathe out',
          // body: '',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/not.png',
          largeIcon: 'asset://assets/not.png',),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(const Duration(seconds: 61980)), repeats: true));
      // schedule: NotificationInterval(interval: 61980, timeZone: localTimeZone, repeats: true));
      // 17 hours 13 minutes

  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1,
          channelKey: 'alerts',
          title: 'Remember to breathe out',
          // body: '',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/not.png',
          largeIcon: 'asset://assets/not.png'),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(const Duration(seconds: 104820)), repeats: true));
      // schedule: NotificationInterval(interval: 107460, timeZone: localTimeZone, repeats: true));
      // 29 hours 07 minutes
  }

  static Future<void> resetBadgeCounter() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
