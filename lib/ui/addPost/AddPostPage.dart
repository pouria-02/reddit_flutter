import 'package:flutter/material.dart';
import 'package:flutter_reddit/DataRepository.dart';
import 'package:flutter_reddit/model/Community.dart';
import 'package:flutter_reddit/model/Post.dart';
import 'package:flutter_reddit/ui/main/MainPage.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  bool isNextButtonEnable = false;

  final FocusNode _titleFocusNode = FocusNode();
  final TextEditingController _titleController = TextEditingController();

  final FocusNode _bodyFocusNode = FocusNode();
  final TextEditingController _bodyController = TextEditingController();

  Community dropDownValue = DataRepository.communityList.first;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: isNextButtonEnable
                          ? () {
                              Post newPost = Post(
                                  DataRepository.postList.last.id + 1,
                                  dropDownValue.communityName,
                                  _bodyController.text,
                                  _titleController.text,
                                  0,
                                  'http://clips.vorwaerts-gmbh.de/VfE_html5.mp4',
                                  DataRepository.myUserData,
                                  false,
                                  false,
                                  DateTime.now(), []);
                              DataRepository.postList.insert(0, newPost);

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const MainPage(),
                                ),
                              );
                            }
                          : null,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: isNextButtonEnable
                              ? Colors.white
                              : const Color(0xFF616161),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return const Color.fromRGBO(26, 26, 26, .85);
                          }
                          return null;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        dropDownValue.profileCommunityURL,
                        width: 55,
                        height: 55,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    DropdownButton(
                      value: dropDownValue,
                      underline: const SizedBox(),
                      dropdownColor: const Color.fromRGBO(18, 18, 18, .87),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30,
                        color: Colors.grey,
                      ),
                      items: DataRepository.communityList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Text(
                              item.communityName,
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.white),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (Community? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'RULES',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  focusNode: _titleFocusNode,
                  controller: _titleController,
                  validator: _titleValidator,
                  onChanged: (value) {
                    if (value.length > 3 && _bodyController.text.length > 13) {
                      setState(() {
                        isNextButtonEnable = true;
                      });
                    } else {
                      setState(() {
                        isNextButtonEnable = false;
                      });
                    }
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    node.requestFocus(_bodyFocusNode);
                  },
                  style: const TextStyle(color: Colors.white, fontSize: 28),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add a title',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 28),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  focusNode: _bodyFocusNode,
                  controller: _bodyController,
                  validator: _bodyValidator,
                  onChanged: (value) {
                    if (value.length > 13 && _titleController.text.length > 3) {
                      setState(() {
                        isNextButtonEnable = true;
                      });
                    } else {
                      setState(() {
                        isNextButtonEnable = false;
                      });
                    }
                  },
                  style: const TextStyle(color: Colors.white, fontSize: 23),
                  keyboardType: TextInputType.text,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add body text',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 23),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _titleValidator(value) {
    if (value == null || value.isEmpty)
      return 'title is required';
    else if (value.length < 3) {
      return "too short";
    } else
      return null;
  }

  String? _bodyValidator(value) {
    if (value == null || value.isEmpty)
      return 'body is required';
    else if (value.length < 13) {
      return "too short";
    } else
      return null;
  }
}
