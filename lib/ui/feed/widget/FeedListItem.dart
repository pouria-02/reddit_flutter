import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reddit/model/Post.dart';
import 'package:video_player/video_player.dart';

class FeedListItem extends StatefulWidget {
  const FeedListItem({Key? key, required this.postItem}) : super(key: key);
  final Post postItem;

  @override
  State<FeedListItem> createState() => _FeedListItemState();
}

class _FeedListItemState extends State<FeedListItem> {
  @override
  Widget build(BuildContext context) {
    VideoPlayerController _controller =
        VideoPlayerController.asset(widget.postItem.contentURL);
    setState(() {
      _controller.play();
    });

    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 16,
              ),
              ClipOval(
                child: Image.network(
                  widget.postItem.user.profileImageURL,
                  width: 55,
                  height: 55,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Row(

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.postItem.user.userName),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(widget.postItem.user.subtitle),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text("."),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(widget.postItem.getPastPublishTime())
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz_sharp,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.postItem.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 120,
              width: MediaQuery.of(context).size.width,
              child: VideoPlayer(_controller)),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                IconButton(
                  onPressed: () {
                    if (widget.postItem.isLiked) {
                      setState(() {
                        widget.postItem.decreaseLikeCount();
                        widget.postItem.isLiked = false;
                      });
                    } else {
                      setState(() {
                        widget.postItem.increaseLikeCount();
                        widget.postItem.isLiked = true;
                      });
                    }
                  },
                  icon: Icon(
                    widget.postItem.isLiked
                        ? Icons.arrow_circle_up_sharp
                        : Icons.arrow_circle_up_outlined,
                  ),
                ),
                Text(widget.postItem.likeCount.toString()),

                IconButton(
                  onPressed: () {
                    if (widget.postItem.isDisliked) {
                      setState(() {
                        widget.postItem.decreaseDisLikeCount();
                        widget.postItem.isDisliked = false;
                      });
                    } else {
                      setState(() {
                        widget.postItem.increaseDisLikeCount();
                        widget.postItem.isDisliked = true;
                      });
                    }
                  },
                  icon: Icon(
                    widget.postItem.isLiked
                        ? Icons.arrow_circle_down_sharp
                        : Icons.arrow_circle_down_outlined,
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: () {

                }, icon: const Icon(Icons.mode_comment_outlined)),
                Text(widget.postItem.commentCount.toString()),
                const Spacer(),
                IconButton(onPressed: () {

                }, icon: const Icon(Icons.upload_sharp)),
                const Text("Share"),
                const Spacer(),
                IconButton(onPressed: () {

                }, icon: const Icon(Icons.card_giftcard)),
                const Text("Award"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
