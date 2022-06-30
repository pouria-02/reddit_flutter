import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reddit/model/Post.dart';
import 'package:flutter_reddit/ui/feedDetail/FeedDetailPage.dart';
import 'package:video_player/video_player.dart';

class FeedListItem extends StatefulWidget {
  const FeedListItem({Key? key, required this.postItem}) : super(key: key);
  final Post postItem;

  @override
  State<FeedListItem> createState() => _FeedListItemState();
}

class _FeedListItemState extends State<FeedListItem> {
  GlobalKey key = GlobalKey();
  bool _isVideoPlaying = false;
  late VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = VideoPlayerController.asset(widget.postItem.contentURL);
    _controller.play();

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FeedDetailPage(
              postItem: widget.postItem,
            ),
          ),
        );
      },
      child: Container(
        color: const Color.fromRGBO(18, 18, 18, .87),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
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
                        Text(
                          widget.postItem.user.userName,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.postItem.community.communityName,
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
                            Text(
                              widget.postItem.getPastPublishTime(),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            )
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
                    color: Colors.grey,
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
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isVideoPlaying = true;
                    _controller.play();
                  });
                },
                child: Stack(
                  children: [
                    Visibility(
                      visible: !_isVideoPlaying,
                      child: Image.network(
                        widget.postItem.thumbnailURL,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Visibility(
                      visible: !_isVideoPlaying,
                      child: const Positioned(
                        top: 1,
                        bottom: 1,
                        right: 1,
                        left: 1,
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 125,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _isVideoPlaying,
                      child: VideoPlayer(
                        _controller,
                        key: key,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    widget.postItem.likeCount.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
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
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mode_comment_outlined,
                        color: Colors.grey,
                      )),
                  Text(
                    widget.postItem.comments.length.toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.upload_sharp,
                        color: Colors.grey,
                      )),
                  const Text(
                    "Share",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.card_giftcard,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    "Award",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
