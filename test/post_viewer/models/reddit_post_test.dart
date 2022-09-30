import 'package:flutter_test/flutter_test.dart';
import 'package:reddit_flutterdev_viewer/post_viewer/models/reddit_post.dart';

void main() {
  test('RedditPost.fromAnother equality', () {
    const post1 = RedditPost(id: "x", title: "", selftext: "", thumbnail: null, ups: 1);
    final post2 = RedditPost.fromAnother(post1);
    expect(post1 == post2, false);
    expect(post1.id == post2.id, true);
  });
}