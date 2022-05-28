import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add_post extends StatelessWidget {
  const Add_post({Key? key}) : super(key: key);

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
      body: Statefuladdpost(),
    );
  }
}
class Statefuladdpost extends StatefulWidget {
  const Statefuladdpost({Key? key}) : super(key: key);

  @override
  State<Statefuladdpost> createState() => _StatefuladdpostState();
}

class _StatefuladdpostState extends State<Statefuladdpost> {
  TextEditingController title=TextEditingController();
  TextEditingController description=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(1),
                child: const Text(
                  'Add Post',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: title,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Colors.white)
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: description,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.white)
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Add Post'),
                  onPressed: () {
                    print(title.text);
                    print(description.text);
                  },
                )
            ),
          ],
        ));
  }
}
