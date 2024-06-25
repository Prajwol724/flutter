import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/firebase_options.dart';
import 'package:practice_firebase/providers/form_provider.dart';
import 'package:practice_firebase/providers/get_value_provider.dart';
import 'package:practice_firebase/view/get_value.dart';
import 'package:practice_firebase/view/view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => FormProvider())),
        ChangeNotifierProvider(create: ((context) => GetValueProvider()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: GetValue()
          
          ),
    );
  }
}
