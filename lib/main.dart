import 'package:firebase_app/features/app/splash_screen/splash_screen.dart';
import 'package:firebase_app/features/user_auth/presentation/pages/home_page.dart';
import 'package:firebase_app/features/user_auth/presentation/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA8s4Q5b8s3gIyyixiRCL333UhITeg4-3M",
        appId: "1:648201197678:web:cc2e44ef277d4ea5036e7f", 
        messagingSenderId: "648201197678", 
        projectId: "flutter-firebase-login-a-930e5"
      ));
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LogInPage(),
        ),
        '/login':(context) => LogInPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
