import 'package:hive_flutter/hive_flutter.dart';

class DBService {
  List postList = [];

  final _mypostBox = Hive.box('posts');

  List loadData() {
    postList = _mypostBox.get('postsDB')!;
    return postList;
  }

  void updateDatabase() {
    _mypostBox.put('postsDB', postList);
  }
}
