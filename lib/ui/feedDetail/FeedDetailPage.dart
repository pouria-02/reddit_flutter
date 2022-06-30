import 'package:flutter/material.dart';
import 'package:flutter_reddit/DataRepository.dart';
import 'package:flutter_reddit/model/Comment.dart';
import 'package:flutter_reddit/model/Post.dart';
import 'package:flutter_reddit/ui/feedDetail/widget/CommentListItem.dart';

class FeedDetailPage extends StatefulWidget {
  const FeedDetailPage({Key? key, required this.postItem}) : super(key: key);

  @override
  State<FeedDetailPage> createState() => _FeedDetailPageState();

  final Post postItem;
}

class _FeedDetailPageState extends State<FeedDetailPage> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: myAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                color: const Color.fromRGBO(18, 18, 18, .87),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userDataRow(),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      widget.postItem.title,
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      child: Text(
                        widget.postItem.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    upperActionsRow(),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "Comments",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width - 80,
                child: widget.postItem.comments.isEmpty
                    ? const Center(
                        child: Text('Be the first one to comment'),
                      )
                    : ListView.builder(
                        itemCount: widget.postItem.comments.length,
                        itemBuilder: (context, index) {
                          Comment currentComment =
                              widget.postItem.comments[index];
                          return CommentListItem(
                              currentComment: currentComment,
                              postItem: widget.postItem);
                        },
                      ),
              ),
              Container(
                height: 80,
                margin: const EdgeInsets.only(top: 4),
                color: const Color.fromRGBO(18, 18, 18, .87),
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextFormField(
                        controller: _commentController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        minLines: 1,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 40, right: 8),
                          hintText: 'Add a comment',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      onPressed: () {
                        String commentText = _commentController.text;
                        if (commentText.length > 2) {
                          Comment newComment = Comment(
                            DataRepository.commentList.last.id + 1,
                            DataRepository.myUserData,
                            commentText,
                            widget.postItem.id,
                          );
                          setState(() {
                            DataRepository.commentList.insert(0, newComment);
                            _commentController.clear();
                          });

                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "You should enter at least 3 character",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.send_sharp,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Row upperActionsRow() {
    return Row(
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
          style: const TextStyle(color: Colors.grey, fontSize: 16),
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
          widget.postItem.commentCount.toString(),
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
    );
  }

  Row userDataRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                  widget.postItem.user.subtitle,
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
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          color: const Color.fromRGBO(18, 18, 18, .87),
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          color: const Color.fromRGBO(18, 18, 18, .87),
          icon: const Icon(
            Icons.more_horiz_sharp,
            color: Colors.white,
          ),
        ),
      ],
      backgroundColor: const Color.fromRGBO(18, 18, 18, .87),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 28,
          color: Colors.grey,
        ),
      ),
    );
  }
}
