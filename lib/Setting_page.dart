import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting_page extends StatelessWidget {
  const Setting_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(height: 45.0,
            child: Image.asset("asset/images/reddit.png")
        ),
        backgroundColor: Colors.black,),
      body: const MyStatefulWidget(),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidget();
}


class _MyStatefulWidget extends State<MyStatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("salam"),
    );

  }

}


