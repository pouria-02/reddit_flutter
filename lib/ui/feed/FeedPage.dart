import 'package:flutter/material.dart';
import 'package:flutter_reddit/DataRepository.dart';
import 'package:flutter_reddit/model/Post.dart';
import 'package:flutter_reddit/ui/SettingPage.dart';
import 'package:flutter_reddit/ui/feed/widget/FeedListItem.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
              },
              icon: const Icon(
                  Icons.settings,
                color: Colors.white,
              )
          )
        ],
        centerTitle: true,
        title: SizedBox(height: 45.0,
        child: Image.asset("asset/images/reddit.png"),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: DataRepository.postList.length,
          itemBuilder: (context, index) {
            Post postItem = DataRepository.postList[index];
            return FeedListItem(postItem: postItem);
        },),
      )
    );
  }
}