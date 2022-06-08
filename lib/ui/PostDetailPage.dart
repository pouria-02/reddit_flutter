import 'package:flutter/material.dart';
import 'package:flutter_reddit/DataRepository.dart';
import 'package:flutter_reddit/model/Comment.dart';
import 'package:flutter_reddit/model/User.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  List<User> _list = [];
  // Comment comment = Comment(202, "test", 302, 102);
  TextEditingController testController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // User user = _list.firstWhere((element) => element.id == 100);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_alert,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  // DataRepository.increaseLikeCount(commentId);
                  //DataRepository.
                },
                child: Text("comment.commentLikesCount.toString()")),//TODO
            TextFormField(
              controller: testController,
            )
          ],
        ),
      ),
    );
  }
}
