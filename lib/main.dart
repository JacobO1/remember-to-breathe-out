import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'notification_service.dart';

Future<void> main() async {
  await NotificationController.initializeLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MyApp.navigatorKey,
      title: 'Remember to breathe out',
      theme: ThemeData.dark(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      ),
      home: const HomeScreen(),
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    NotificationController.startListeningNotificationEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 247, 110, 68),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(
      //         Icons.settings,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         Navigator.pushNamed(context, '/settings');
      //       },
      //     )
      //   ],
      // ),
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"), 
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: const Alignment(-0.95, -0.046), // center with vertical offset
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Colors.green, Colors.lightGreen],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: const Text(
                  'Remember to breathe out',
                  style: TextStyle(fontSize: 27,
                  fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          FutureBuilder<bool>(
            future: getButton(),
            builder: (context, snapshot) {
              print(snapshot.hasData);
              if (!snapshot.data!) {
                return Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(left: 120, right: 120, top: 6, bottom: 6),
                          ),
                          child: const Text('Enable notifications!'),
                          onPressed: () async {
                            await AwesomeNotifications().requestPermissionToSendNotifications();
                            setState(() {});
                            await NotificationController.createNewNotification();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                );
              } else {
                return const SizedBox();
                // Column(
                //   children: [
                // Expanded(
                //   child: Align(
                //         alignment: FractionalOffset.bottomCenter,
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             padding: const EdgeInsets.only(left: 120, right: 120, top: 6, bottom: 100),
                //           ),
                //           onPressed: () async {
                //             NotificationController.test1();
                //           },
                //           child: const Text('TEST!!!')),
                //         ),
                //   ),
                //   ],
                // );
              }
            },
          ),
        ],
      ),
    );
  }
}

Future<bool> getButton() async {
  return await NotificationController.notificationsAllowed();
}
