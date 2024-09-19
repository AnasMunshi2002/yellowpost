// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yellowpost/screens/postscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final postBox = await Hive.openBox('posts');
  runApp(const YellowPost());
}

class YellowPost extends StatelessWidget {
  const YellowPost({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Yellow Post",
      debugShowCheckedModeBanner: false,
      home: PostScreen(),
    );
  }
}
