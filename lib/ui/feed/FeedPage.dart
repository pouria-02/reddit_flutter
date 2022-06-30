import 'package:flutter/material.dart';
import 'package:flutter_reddit/model/Post.dart';
import 'package:flutter_reddit/ui/feed/widget/FeedListItem.dart';
import 'package:flutter_reddit/utils/DataRepository.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DataRepository.postList.length,
      itemBuilder: (context, index) {
        Post postItem = DataRepository.postList[index];
        return FeedListItem(postItem: postItem);
      },);
  }
}
