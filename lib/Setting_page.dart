import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reddit/Login_Page.dart';


class Setting_page extends StatelessWidget {
  const Setting_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: SizedBox(
          height: 45.0,
          child: Image.asset("asset/images/reddit.png"),
        ),
      ),
      body: SettingStateful(),
    );
  }
}


class SettingStateful extends StatefulWidget {
  const SettingStateful({Key? key}) : super(key: key);

  @override
  State<SettingStateful> createState() => _SettingStatefulState();
}

class _SettingStatefulState extends State<SettingStateful> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
      child:
      ListView(
        children: <Widget>[
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ElevatedButton.icon(
              icon:Icon(Icons.account_box,
                color: Colors.white,
              ) ,
              style: ElevatedButton.styleFrom(minimumSize: const Size(450, 20),primary: Colors.black,onPrimary: Colors.purple),
              label:const Text('profile                                                                                                                          ',style: TextStyle(color: Colors.white),),
              onPressed: (){

              },
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(
                    Icons.add,
                    color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(minimumSize: const Size(450, 20),primary:Colors.black,onPrimary: Colors.purple),
                label: const Text("Add society                                                                                                                     ",style: TextStyle(color: Colors.white),),

          ),
          )],
      )
    );
  }
}








