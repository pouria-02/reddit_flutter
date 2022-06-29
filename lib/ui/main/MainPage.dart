import 'package:flutter/material.dart';
import 'package:flutter_reddit/ui/SettingPage.dart';
import 'package:flutter_reddit/ui/addPost/AddPostPage.dart';
import 'package:flutter_reddit/ui/feed/FeedPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  bool _shouldShowAppBar = true;
  bool _shouldShowBottomNav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: bottomNav(),
        appBar: myAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: choosePage(),
        ));
  }

  BottomNavigationBar? bottomNav() {
    return _shouldShowBottomNav
        ? BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                switch(_currentIndex) {
              case 0:
                _shouldShowAppBar = true;
                _shouldShowBottomNav = true;
                break;
              case 1:
                _shouldShowAppBar = false;
                _shouldShowBottomNav = true;
                break;
              case 2:
                _shouldShowAppBar = false;
                _shouldShowBottomNav = false;
                break;

            }
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromRGBO(18, 18, 18, .87),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.explore,
                    size: 35,
                  ),
                  label: 'explorer'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    size: 35,
                  ),
                  label: 'add post'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.comment,
                    size: 35,
                  ),
                  label: 'comment'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    size: 35,
                  ),
                  label: 'notification'),
            ],
          )
        : null;
  }

  Widget choosePage() {
    switch (_currentIndex) {
      case 0:
        return const FeedPage();
      case 1:
        return const FeedPage();
      case 2:
        return const AddPostPage();
      case 3:
        return const FeedPage();
      case 4:
        return const FeedPage();
    }
    return const FeedPage();
  }

  AppBar? myAppBar(BuildContext context) {
    return _shouldShowAppBar
        ? AppBar(
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingPage()));
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ))
            ],
            centerTitle: true,
            title: SizedBox(
              height: 45.0,
              child: Image.asset("asset/images/reddit.png"),
            ),
            backgroundColor: const Color.fromRGBO(18, 18, 18, .87),
          )
        : null;
  }
}
