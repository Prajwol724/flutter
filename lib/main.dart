import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:practice_firebase/firebase_options.dart';
import 'package:practice_firebase/providers/form_provider.dart';
import 'package:practice_firebase/providers/get_value_provider.dart';
import 'package:practice_firebase/providers/shakti_provider.dart';
import 'package:practice_firebase/view/get_value.dart';
import 'package:practice_firebase/view/login.dart';
import 'package:practice_firebase/view/otp.dart';
import 'package:practice_firebase/view/otp1.dart';
import 'package:practice_firebase/view/photo_upload.dart';
import 'package:practice_firebase/view/router_generator.dart';
import 'package:practice_firebase/view/routes.dart';
import 'package:practice_firebase/view/shakti_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
 MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

@override
  void initState() {
    notificationSetting();
    listenForeGroundMessage();
    getFCMToken();
    init();
    super.initState();
  }
Future<void> init() async {
    // Initialize native android notification
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Initialize native Ios Notifications
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      onDidReceiveNotificationResponse: (details){
firebaseNavigatorKey.currentState?.pushNamed(Routes.notificationRoute);
      }
    );
  }
  void showNotificationAndroid(String title, String value) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'Channel Name',
            channelDescription: 'Channel Description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');

    int notification_id = 1;
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin
        .show(notification_id, title, value, notificationDetails, payload: 'Not present');
  }
final GlobalKey<NavigatorState> firebaseNavigatorKey =
    GlobalKey<NavigatorState>();


void notificationSetting()async{


NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

print('User granted permission: ${settings.authorizationStatus}');
}
listenForeGroundMessage(){
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  showNotificationAndroid(message.notification!.title!, message.notification!.body!);
  
}

);
FirebaseMessaging.onMessageOpenedApp.listen((event) {
  firebaseNavigatorKey.currentState?.pushNamed(Routes.notificationRoute);
 });
}




getFCMToken()async{
  String? token =await messaging.getToken();
  print("FCM token:$token");
}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => FormProvider())),
        ChangeNotifierProvider(create: ((context) => GetValueProvider())),
        ChangeNotifierProvider(create: ((context)=> ShaktimanProvider()))
      ],
      child: MaterialApp(
onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: firebaseNavigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: OtpTest()
          
          ),
    );
  }
}
