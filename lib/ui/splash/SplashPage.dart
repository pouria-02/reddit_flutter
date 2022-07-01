import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reddit/ui/login/LoginPage.dart';
import 'package:flutter_reddit/ui/main/MainPage.dart';
import 'package:flutter_reddit/utils/PrefManager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    _controllerListener(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, .87),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/reddit.png',
                height: 150,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'My Reddit',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).primaryColorDark),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _controllerListener(BuildContext context) {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            if (PrefManager().isUserLogin()) {
              return const MainPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
