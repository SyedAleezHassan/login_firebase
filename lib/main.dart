import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/firebase_options.dart';
import 'package:loginpage/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure widgets binding is initialized before Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e, stacktrace) {
    print('Firebase initialization failed: $e');
    print('Stacktrace: $stacktrace');
    // Optionally handle error, for example, show an error screen or retry initialization
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginPage(),
      
    );
  }
}
