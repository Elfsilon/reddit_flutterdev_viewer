import 'package:reddit_flutterdev_viewer/features/post_viewer/models/reddit_post.dart';

class RedditPostList {
  const RedditPostList({
    required this.items,
  });

  final List<RedditPost> items;

  factory RedditPostList.fromJson(List<dynamic> json) {
    final items = json.map((jsonPost) => RedditPost.fromJson(jsonPost)).toList();
    return RedditPostList(items: items);
  }

  List<Map<String, dynamic>> toJson() {
    final json = items.map((e) => e.toJson()).toList();
    return json;
  }
}

extension MutableRedditPostList on RedditPostList {
  RedditPostList refresh(RedditPostList actual) {
    final toUpdate = <RedditPost>[...items];
    List<RedditPost> toInsert = [];
    for (int i = 0; i < actual.items.length; i++) {
      final indexOfUpdatingPost = toUpdate.indexWhere((el) => el.id == actual.items[i].id);
      final bool contains = indexOfUpdatingPost != -1;
      if (contains) {
        toUpdate[indexOfUpdatingPost] = RedditPost.fromAnother(actual.items[i]);
      } else {
        toInsert.add(RedditPost.fromAnother(actual.items[i]));
      }
    }
    final refreshed = [...toInsert, ...toUpdate];
    return RedditPostList(items: refreshed);
  }
}