import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reddit/Setting_page.dart';

class Feed_page extends StatelessWidget {
  const Feed_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting_page()));
              },
              icon: Icon(
                  Icons.settings,
                color: Colors.white,
              )
          )
        ],
        centerTitle: true,
        title: SizedBox(height: 45.0,
        child: Image.asset("asset/images/reddit.png"),
        ),
        backgroundColor: Colors.black,
      ),
      body: Feed_stateful(),
    );
  }
}


class Feed_stateful extends StatefulWidget {
  const Feed_stateful({Key? key}) : super(key: key);

  @override
  State<Feed_stateful> createState() => _Feed_statefulState();
}

class _Feed_statefulState extends State<Feed_stateful> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print("salam");
        },
        child: Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          alignment: Alignment.center,
          child: const CircleAvatar(),
        ),
      ),
      title: const Text('title'),
      dense: false,
    );
  }
}