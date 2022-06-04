import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_reddit/Change_email.dart';
import 'package:flutter_reddit/Change_password.dart';
import 'package:flutter_reddit/Change_username.dart';
import 'package:flutter_reddit/Post.dart';

import 'User.dart';


class Profile_page extends StatelessWidget {

  late List<User> users;


  Profile_page({required List<User> users}){
    this.users=users;
  }

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
      body: Profile_stateful(),
    );
  }
}


class Profile_stateful extends StatefulWidget {

  const Profile_stateful({Key? key}) : super(key: key);

  @override
  State<Profile_stateful> createState() => _Profile_statefulState();
}

class _Profile_statefulState extends State<Profile_stateful> {
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
              child: Text("Username:                                pouria                                                                                            ",style: TextStyle(color: Colors.white),)

            ),
            Container(
              height: 50.0,
              child: Text("Email:                                   p.adabi1381@gmail.com                                                                             ",style: TextStyle(color: Colors.white),),
            ),
            Container(
              height: 50.0,
              child: Text("Password:                                 Pouria.adabi1381                                                                                 ",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Change_username()));
                },
                child: const Text("Change username")
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Change_email()));
                },
                child: const Text("Change email")
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Change_password()));
                },
                child: const Text("Change password")
            )
      ],
    );
  }
}
