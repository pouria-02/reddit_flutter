import 'package:flutter/material.dart';


class Change_email extends StatelessWidget {
  const Change_email({Key? key}) : super(key: key);

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
      body: Change_email_stateful(),
    );
  }
}

class Change_email_stateful extends StatefulWidget {
  const Change_email_stateful({Key? key}) : super(key: key);

  @override
  State<Change_email_stateful> createState() => _Change_email_statefulState();
}

class _Change_email_statefulState extends State<Change_email_stateful> {

  TextEditingController emailController=TextEditingController();

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
                  'Change email',
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
                'Change your email',
                style: TextStyle(fontSize: 15,color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller:emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  labelText: 'Enter your new email',
                  labelStyle: TextStyle(color: Colors.white,fontSize: 12.5)
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text("Change your email"),
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

