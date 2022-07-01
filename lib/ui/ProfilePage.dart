import 'package:flutter/material.dart';
import 'package:flutter_reddit/ui/ChangeEmailPage.dart';
import 'package:flutter_reddit/ui/ChangePasswordPage.dart';
import 'package:flutter_reddit/ui/ChangeUsernamePage.dart';

import '../model/User.dart';

class ProfilePage extends StatelessWidget {
  final User users;

  const ProfilePage({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 45.0,
          child: Image.asset("asset/images/reddit.png"),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 50.0,
                //color: Colors.green,
                child: const Text(
                  "Username:                                pouria                                                                                            ",
                  style: TextStyle(color: Colors.white),
                )),
            Container(
              height: 50.0,
              child: const Text(
                "Email:                                   p.adabi1381@gmail.com                                                                             ",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              height: 50.0,
              child: const Text(
                "Password:                                 Pouria.adabi1381                                                                                 ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangeUsernamePage()));
            },
            child: const Text("Change username")),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangeEmailPage()));
            },
            child: const Text("Change email")),
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangePasswordPage()));
            },
            child: const Text("Change password"))
      ],
    );
  }
}
