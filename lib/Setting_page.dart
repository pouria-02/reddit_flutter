import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reddit/Add%20community_page.dart';
import 'package:flutter_reddit/Login_Page.dart';
import 'package:flutter_reddit/Profile_page.dart';


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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_page(users: [],)));
              },
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ElevatedButton.icon(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Community()));
                },
                icon: Icon(
                    Icons.add,
                    color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(minimumSize: const Size(450, 20),primary:Colors.black,onPrimary: Colors.purple),
                label: const Text("Add community                                                                                                         ",style: TextStyle(color: Colors.white),),

          ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.bookmark,
                color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(minimumSize: const Size(450, 20),primary: Colors.black,onPrimary: Colors.purple),
                label: const Text("Saved post                                                                                                             ",style: TextStyle(color: Colors.white),),
          )
          )
        ],
      )
    );
  }
}








