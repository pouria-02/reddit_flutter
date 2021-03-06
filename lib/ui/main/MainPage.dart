import 'package:flutter/material.dart';
import 'package:flutter_reddit/ui/Add%20community_page.dart';
import 'package:flutter_reddit/ui/addPost/AddPostPage.dart';
import 'package:flutter_reddit/ui/communityPage/CommunityPage.dart';
import 'package:flutter_reddit/ui/feed/FeedPage.dart';
import 'package:flutter_reddit/ui/login/LoginPage.dart';
import 'package:flutter_reddit/ui/profile/ProfilePage.dart';
import 'package:flutter_reddit/utils/PrefManager.dart';

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
        drawer: myDrawer(context),
        bottomNavigationBar: bottomNav(),
        appBar: myAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: choosePage(),
        ));
  }

  Drawer myDrawer(BuildContext context) {
    var prefManager = PrefManager();
    return Drawer(
      backgroundColor: const Color.fromRGBO(18, 18, 18, .87),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ClipOval(
                    child: Image.network(
                      prefManager.getUser()!.profileImageURL,
                      width: 85,
                      height: 85,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            prefManager.getUser()!.userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            prefManager.getUser()!.subtitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.all(16),
              color: Colors.black,
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Profile',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    leading: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 24,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Add Community',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    leading: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddCommunityPage(),
                        ),
                      );
                    },
                  ),
                  const ListTile(
                    title: const Text(
                      'Saved Post',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    leading: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'SignOut',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    leading: const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 24,
                    ),
                    onTap: () {
                      prefManager.setUserLogin(false);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
        return const CommunityPage();
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
            centerTitle: true,
            title: SizedBox(
              height: 45.0,
              width: MediaQuery.of(context).size.width - 150,
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
                    textInputAction: TextInputAction.done,
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
          )
        : null;
  }
}
