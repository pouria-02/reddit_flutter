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
      bottomNavigationBar: const bottomNav(),
      appBar: myAppBar(context),
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

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingPage()));
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
      backgroundColor:const Color.fromRGBO(18, 18, 18, .87),
    );
  }
}

class bottomNav extends StatelessWidget {
  const bottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor:const Color.fromRGBO(18, 18, 18, .87),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home, size: 35,),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore, size: 35,),label: 'explorer'),
        BottomNavigationBarItem(icon: Icon(Icons.add, size: 35,),label: 'add post'),
        BottomNavigationBarItem(icon: Icon(Icons.comment, size: 35,),label: 'comment'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications, size: 35,),label: 'notification'),
      ],
    );
  }
}