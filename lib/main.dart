import 'package:flutter/material.dart';
import 'package:flutter_reddit/ui/main/MainPage.dart';

void main() => runApp(const MyApp());

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
      home: MainPage(),
    );
  }
}
