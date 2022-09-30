import 'package:flutter_test/flutter_test.dart';
import 'package:reddit_flutterdev_viewer/post_viewer/models/reddit_post.dart';
import 'package:reddit_flutterdev_viewer/post_viewer/models/reddit_post_list.dart';

void main() {
  test("refresh RedditPostList when it's not empty", () {
    var posts = const RedditPostList(items: [
      RedditPost(
        id: "0",
        title: "title", 
        selftext: "text", 
        thumbnail: null, 
        ups: 0,
      ),
      RedditPost(
        id: "1",
        title: "title", 
        selftext: "text", 
        thumbnail: null, 
        ups: 0,
      ),
    ]);

    var updatedPosts = const RedditPostList(items: [
      RedditPost(
        id: "0",
        title: "title updated", 
        selftext: "text updated", 
        thumbnail: "https://thumbnail/somethumbnail.png", 
        ups: 0,
      ),
      RedditPost(
        id: "2",
        title: "title", 
        selftext: "text", 
        thumbnail: null, 
        ups: 0,
      ),
      RedditPost(
        id: "3",
        title: "title", 
        selftext: "text", 
        thumbnail: null, 
        ups: 0,
      ),
    ]);

    final refreshed = posts.refresh(updatedPosts);

    expect(refreshed.items.length == 4, true);
    expect(refreshed.items[0].id == "2", true);
    expect(refreshed.items[1].id == "3", true);
    expect(
      refreshed.items[2].title == "title updated"
      && refreshed.items[2].selftext == "text updated" 
      && refreshed.items[2].thumbnail == "https://thumbnail/somethumbnail.png", 
      true
    );
  });

  test("refresh RedditPostList when it's empty", () {
    var posts = const RedditPostList(items: []);
    var updatedPosts = const RedditPostList(items: [
      RedditPost(
        id: "0",
        title: "title", 
        selftext: "text", 
        thumbnail: null, 
        ups: 0,
      ),
      RedditPost(
        id: "1",
        title: "title", 
        selftext: "text", 
        thumbnail: null, 
        ups: 0,
      ),
    ]);

    final refreshed = posts.refresh(updatedPosts);

    expect(refreshed.items.length == 2, true);
    expect(refreshed.items[0].id == "0", true);
    expect(refreshed.items[1].id == "1", true);
  });
}