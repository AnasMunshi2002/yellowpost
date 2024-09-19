// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellowpost/model%20class/Post.dart';
import 'package:yellowpost/service/httpService.dart';

class ViewPost extends StatefulWidget {
  Post? post;
  ViewPost({required this.post});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 121, 121, 121),
      appBar: AppBar(
        title: Text("User : ${widget.post!.userId}"),
      ),
      body: FutureBuilder(
        future: httpService.viewSinglePost(widget.post!.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.hasError) {
            return const Center(
              child: Text("ERROR FETCHING!!"),
            );
          } else {
            Post post = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
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
            );
          }
        },
      ),
    );
  }
}
