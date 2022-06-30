import 'package:flutter/material.dart';
import 'package:flutter_reddit/model/Comment.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({
    Key? key,
    required this.currentComment,
  }) : super(key: key);

  final Comment currentComment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: const Color.fromRGBO(18, 18, 18, .87),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Image.network(
                  currentComment.user.profileImageURL,
                  width: 55,
                  height: 55,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                currentComment.user.userName,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const Text("."),
              const SizedBox(
                width: 4,
              ),
              const Text(
                '5m',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            currentComment.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  size: 16,
                  color: Colors.grey,
                ),
                splashRadius: 22,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.card_giftcard,
                  size: 16,
                  color: Colors.grey,
                ),
                splashRadius: 22,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.reply_rounded,
                  size: 16,
                  color: Colors.grey,
                ),
                splashRadius: 22,
              ),
              const Text(
                'Reply',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_circle_up_outlined,
                  color: Colors.grey,
                  size: 18,
                ),
                splashRadius: 22,
              ),
              const Text(
                '0',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_circle_down_outlined,
                  color: Colors.grey,
                  size: 18,
                ),
                splashRadius: 22,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
