import 'package:flutter/material.dart';
class Add_Community extends StatelessWidget {
  const Add_Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(height: 45.0,
          child: Image.asset("asset/images/reddit.png"),
        ),
        backgroundColor: Colors.black,
      ),
      body:const Add_Community_stateful() ,
    );
  }
}

class Add_Community_stateful extends StatefulWidget {
  const Add_Community_stateful({Key? key}) : super(key: key);

  @override
  State<Add_Community_stateful> createState() => _Add_Community_statefulState();
}

class _Add_Community_statefulState extends State<Add_Community_stateful> {
  TextEditingController community_name=TextEditingController();
  TextEditingController username=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Padding(padding: const EdgeInsets.all(10),
        child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(1),
            child: const Text(
              'Add community',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize:25
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: community_name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                labelText: 'Community name',
                labelStyle: TextStyle(color: Colors.white)
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Add community'),
              onPressed: (){
                print(community_name);
              },
            ),
          )
        ],
    ),
    );
  }
}
