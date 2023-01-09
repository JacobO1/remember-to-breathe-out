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

    // if(
    //   receivedAction.actionType == ActionType.SilentAction ||
    //   receivedAction.actionType == ActionType.SilentBackgroundAction
    // ){
    //   // For background actions, you must hold the execution until the end

    // }
    // else {
    //   MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
    //       '/notification-page',
    //           (route) =>
    //       (route.settings.name != '/notification-page') || route.isFirst,
    //       arguments: receivedAction);
    // }
  }

  // ///  *********************************************
  // ///     REQUESTING NOTIFICATION PERMISSIONS
  // ///  *********************************************
  // ///
  // static Future<bool> displayNotificationRationale() async {
  //   bool userAuthorized = false;
  //   BuildContext context = MyApp.navigatorKey.currentContext!;
  //   await showDialog(
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return AlertDialog(
  //           title: Text('Get Notified!',
  //               style: Theme.of(context).textTheme.titleLarge),
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: Image.asset(
  //                       'assets/animated-bell.gif',
  //                       height: MediaQuery.of(context).size.height * 0.3,
  //                       fit: BoxFit.fitWidth,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 20),
  //               const Text(
  //                   'Allow Awesome Notifications to send you beautiful notifications!'),
  //             ],
  //           ),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.of(ctx).pop();
  //                 },
  //                 child: Text(
  //                   'Deny',
  //                   style: Theme.of(context)
  //                       .textTheme
  //                       .titleLarge
  //                       ?.copyWith(color: Colors.red),
  //                 )),
  //             TextButton(
  //                 onPressed: () async {
  //                   userAuthorized = true;
  //                   Navigator.of(ctx).pop();
  //                 },
  //                 child: Text(
  //                   'Allow',
  //                   style: Theme.of(context)
  //                       .textTheme
  //                       .titleLarge
  //                       ?.copyWith(color: Colors.deepPurple),
  //                 )),
  //           ],
  //         );
  //       });
  //   return userAuthorized &&
  //       await AwesomeNotifications().requestPermissionToSendNotifications();
  // }

  ///  *********************************************
  ///     NOTIFICATION CREATION METHODS
  ///  *********************************************
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
        // bigPicture: 'asset://assets/background',
        // largeIcon: 'asset://assets/background'
        bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
        largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
        ),
    schedule: NotificationInterval(
      interval: 60,
      timeZone: AwesomeNotifications.localTimeZoneIdentifier,
      repeats: true));

  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1,
          channelKey: 'alerts',
          title: 'Remember to breathe out',
          // body: '',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/notification'),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(const Duration(seconds: 41820)), repeats: true));
      // schedule: NotificationInterval(interval: 41820, timeZone: localTimeZone, repeats: true));
      // 11 hours 37 minutes
  
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: -1,
          channelKey: 'alerts',
          title: 'Remember to breathe out',
          // body: '',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/notification'),
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
          bigPicture: 'asset://assets/notification'),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(const Duration(seconds: 107460)), repeats: true));
      // schedule: NotificationInterval(interval: 107460, timeZone: localTimeZone, repeats: true));
      // 29 hours 51 minutes

    // await AwesomeNotifications().createNotification(
    //     content: NotificationContent(
    //         id: -1, // -1 is replaced by a random number
    //         channelKey: 'alerts',
    //         title: 'Huston! The eagle has landed!',
    //         body:
    //             "A small step for a man, but a giant leap to Flutter's community!",
    //         bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
    //         largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
    //         //'asset://assets/images/balloons-in-sky.jpg',
    //         notificationLayout: NotificationLayout.BigPicture,
    //         payload: {'notificationId': '1234567890'}),
    //     actionButtons: [
    //       NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
    //       NotificationActionButton(
    //           key: 'REPLY',
    //           label: 'Reply Message',
    //           requireInputText: true,
    //           actionType: ActionType.SilentAction
    //       ),
    //       NotificationActionButton(
    //           key: 'DISMISS',
    //           label: 'Dismiss',
    //           actionType: ActionType.DismissAction,
    //           isDangerousOption: true)
    //     ]);
  }

  static Future<void> scheduleNewNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await AwesomeNotifications().requestPermissionToSendNotifications();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: -1, // -1 is replaced by a random number
            channelKey: 'alerts',
            title: "Huston! The eagle has landed!",
            body:
                "A small step for a man, but a giant leap to Flutter's community!",
            bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
            largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
            //'asset://assets/images/balloons-in-sky.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {
              'notificationId': '1234567890'
            }),
        actionButtons: [
          NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
          NotificationActionButton(
              key: 'DISMISS',
              label: 'Dismiss',
              actionType: ActionType.DismissAction,
              isDangerousOption: true)
        ],
        schedule: NotificationCalendar.fromDate(
            date: DateTime.now().add(const Duration(seconds: 10)), repeats: true));
  }

  static Future<void> resetBadgeCounter() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
