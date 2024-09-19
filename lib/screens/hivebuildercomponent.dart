// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yellowpost/localdb/dbservice.dart';
import 'package:yellowpost/model%20class/Post.dart';
import 'package:yellowpost/screens/viewPost.dart';
import 'package:yellowpost/service/httpService.dart';

class MyHiveBuilder extends StatefulWidget {
  List hivePostList;
  MyHiveBuilder({required this.hivePostList});

  @override
  State<MyHiveBuilder> createState() => _PostBuilderState();
}

List<Post> visitedList = [];

class _PostBuilderState extends State<MyHiveBuilder> {
  final _mypostBox = Hive.box('posts');
  HttpService httpService = HttpService();
  DBService dbService = DBService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.orangeAccent,
            ),
          );
        } else if (!snapshot.hasData || snapshot.data == []) {
          return const Center(
            child: Text("NO POSTS FOUND!!"),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("ERROR FETCHING!!!"),
          );
        } else {
          return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Post post = snapshot.data![index];

                if (visitedList.any(
                  (element) => element == post,
                )) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          visitedList.add(post);
                        });
                        Fluttertoast.showToast(msg: "Marked As Read");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewPost(
                                post: post,
                              ),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.purple.shade400,
                                      radius: 26,
                                      child: Text(
                                        post.userId.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "User ${post.userId}",
                                      style: GoogleFonts.tillana(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                PopupMenuButton(
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                        onTap: () {
                                          visitedList.add(post);
                                          setState(() {});
                                          Fluttertoast.showToast(
                                              msg: "Marked As Read");
                                        },
                                        child: const ListTile(
                                          leading:
                                              Icon(Icons.mark_chat_read_sharp),
                                          title: Text("Mark As Read"),
                                        ))
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "SUBJECT : ${post.title}",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.zillaSlab(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Text("BODY : ${post.body}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          visitedList.add(post);
                        });
                        Fluttertoast.showToast(msg: "Marked As Read");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewPost(
                                post: post,
                              ),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.yellow.shade200,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.purple.shade400,
                                      radius: 26,
                                      child: Text(
                                        post.userId.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "User ${post.userId}",
                                      style: GoogleFonts.tillana(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                PopupMenuButton(
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                        onTap: () {
                                          visitedList.add(post);
                                          setState(() {});
                                          Fluttertoast.showToast(
                                              msg: "Marked As Read");
                                        },
                                        child: const ListTile(
                                          leading:
                                              Icon(Icons.mark_chat_read_sharp),
                                          title: Text("Mark As Read"),
                                        ))
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "SUBJECT : ${post.title}",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.zillaSlab(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Text("BODY : ${post.body}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              });
        }
      },
    );
  }

  void markAsRead(Post post) {
    dbService.postList.add([post, "DONE"]);
    dbService.updateDatabase();
  }

  void markAsUnRead(Post post) {
    dbService.postList.add([post, "UNDONE"]);
    dbService.updateDatabase();
  }
}
