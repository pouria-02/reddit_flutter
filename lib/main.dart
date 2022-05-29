import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_reddit/Add_Post.dart';
import 'package:flutter_reddit/Add_Society.dart';
import 'package:flutter_reddit/Setting_page.dart';
import 'package:flutter_reddit/Sign%20up_page.dart';

import 'Login_Page.dart';

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
      home:Setting_page()
    );
  }
}




