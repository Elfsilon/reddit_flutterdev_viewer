import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/data/reddit_repository.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/models/reddit_post_list.dart';

final redditPostServiceProvider = Provider((ref) => RedditPostService(
  repository: ref.watch(redditRepositoryProvider),
));

class RedditPostService {
  RedditPostService({ required this.repository });

  final RedditRepository repository;

  Future<RedditPostList> getPosts() async {
    try {
      return repository.requestPosts();
    } catch (e) {
      rethrow;
    }
  }

  Future<RedditPostList> refreshPosts(RedditPostList old) async {
    try {
      final actual = await repository.requestPosts();
      final refreshedPosts = old.refresh(actual);
      return refreshedPosts;
    } catch (e) {
      rethrow;
    }
  }
}