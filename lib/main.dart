import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_reddit/ui/Add%20community_page.dart';
import 'package:flutter_reddit/ui/Add%20community_page.dart';
import 'package:flutter_reddit/ui/AddPostPage.dart';
import 'package:flutter_reddit/ui/LoginPage.dart';
import 'package:flutter_reddit/ui/ProfilePage.dart';



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
      home:LoginPage(),
    );
  }
}




