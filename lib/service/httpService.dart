import 'dart:convert';

import 'package:http/http.dart';
import 'package:yellowpost/model%20class/Post.dart';

class HttpService {
  static final httpService = HttpService.internal();

  final String url = "https://jsonplaceholder.typicode.com/posts";

  factory HttpService() {
    return httpService;
  }

  HttpService.internal();

  Future<List<Post>> getPosts() async {
    List<Post> postList = [];
    Response response = await get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        List list = jsonDecode(response.body) as List;
        postList = List.generate(
          list.length,
          (index) => Post.fromJson(list[index]),
        );

        print("Post List fetched");
      }
    } catch (e) {
      print(e.toString());
    }
    return postList;
  }

  Future<Post> viewSinglePost(String postId) async {
    Response response = await get(Uri.parse(url + "/${postId}"));
    Post? post;
    try {
      if (response.statusCode == 200) {
        post = Post.fromJson(jsonDecode(response.body));
        print("Single Post fetched");
      }
    } catch (e) {
      print(e.toString());
    }

    return post ?? Post(body: "NO SUCH POST");
  }
}
