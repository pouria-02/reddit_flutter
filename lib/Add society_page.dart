import 'package:flutter/material.dart';
class Add_society extends StatelessWidget {
  const Add_society({Key? key}) : super(key: key);

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
      body:const Add_Society_stateful() ,
    );
  }
}

class Add_Society_stateful extends StatefulWidget {
  const Add_Society_stateful({Key? key}) : super(key: key);

  @override
  State<Add_Society_stateful> createState() => _Add_Society_statefulState();
}

class _Add_Society_statefulState extends State<Add_Society_stateful> {
  TextEditingController society_name=TextEditingController();
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
              'Add society',
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
              controller: society_name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                labelText: 'Society name',
                labelStyle: TextStyle(color: Colors.white)
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Add society'),
              onPressed: (){
                print(society_name);
              },
            ),
          )
        ],
    ),
    );
  }
}
