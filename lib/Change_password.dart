import 'package:flutter/material.dart';


class Change_password extends StatelessWidget {
  const Change_password({Key? key}) : super(key: key);

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
      body: Change_password_stateful(),
    );
  }
}

class Change_password_stateful extends StatefulWidget {
  const Change_password_stateful({Key? key}) : super(key: key);

  @override
  State<Change_password_stateful> createState() => _Change_password_statefulState();
}

class _Change_password_statefulState extends State<Change_password_stateful> {

  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Change password',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Change your password',
              style: TextStyle(fontSize: 15,color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller:passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  labelText: 'Enter your new password',
                  labelStyle: TextStyle(color: Colors.white,fontSize: 12.5)
              ),
            ),
          ),
          Container(
            height: 50.0,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text("Change your password"),
              onPressed: (){
                print("salma");
              },
            ),
          )
        ],
      ),
    );
  }
}
