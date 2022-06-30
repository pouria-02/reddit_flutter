import 'package:flutter/material.dart';
import 'package:flutter_reddit/ui/splash/SplashPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefsInstance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefsInstance = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Reddit',
      home: const SplashScreen(),
    );
  }
}
