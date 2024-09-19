import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yellowpost/localdb/dbservice.dart';
import 'package:yellowpost/screens/buildercomponent.dart';
import 'package:yellowpost/screens/hivebuildercomponent.dart';
import 'package:yellowpost/service/httpService.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _mypostBox = Hive.box('posts');
  DBService dbService = DBService();
  HttpService httpService = HttpService();
  List hivePostList = [];
  @override
  void initState() {
    super.initState();
    fetchHive();
  }

  fetchHive() async {
    hivePostList = _mypostBox.get('postsDB');
    print(hivePostList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 121, 121, 121),
      appBar: AppBar(
        title: Text(
          "My Posts",
          style: GoogleFonts.abrilFatface(),
        ),
      ),
      body: Container(
          height: double.infinity, width: double.infinity, child: MyBuilder()),
    );
  }
}
