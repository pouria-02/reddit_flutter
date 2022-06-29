import 'package:flutter/material.dart';
import 'package:flutter_reddit/DataRepository.dart';
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
  final TextEditingController _searchController = TextEditingController();

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
                switch (_currentIndex) {
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
                    size: 32,
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
                    size: 32,
                  ),
                  label: 'comment'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    size: 32,
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
                color: const Color.fromRGBO(18, 18, 18, .87),
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
            centerTitle: true,
            title: SizedBox(
              height: 45.0,
              width: MediaQuery.of(context).size.width / 2,
              child: Stack(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                    child: Icon(
                      Icons.search_sharp,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  TextFormField(
                    controller: _searchController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.always,
                    onFieldSubmitted: (v) {
                      //TODO search among the post list
                    },
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 40, right: 8),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: const Color.fromRGBO(18, 18, 18, .87),
            leadingWidth: 75,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ClipOval(
                      child: Image.network(
                        DataRepository.myUserData.profileImageURL,
                        width:40,
                        height:40,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: .1,
                    right: .1,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : null;
  }
}
