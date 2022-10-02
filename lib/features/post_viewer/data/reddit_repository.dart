import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutterdev_viewer/network/config.dart';
import 'package:reddit_flutterdev_viewer/network/dio_client.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/models/reddit_post_list.dart';

final redditRepositoryProvider = Provider((ref) =>
  RedditRepository(client: ref.watch(dioClientProvider)));

class RedditRepository {
  const RedditRepository({ required this.client });

  final DioClient client;

  Future<RedditPostList> requestPosts() async {
    try {
      final Response response = await client.get(Endpoints.flutterDevPosts);
      final List<dynamic> jsonPosts = response.data["data"]["children"] as List<dynamic>;
      final List<dynamic> mappedJsonPosts = jsonPosts.map((e) => e["data"]).toList();
      final posts = RedditPostList.fromJson(mappedJsonPosts);
      return posts;
    } catch (e) {
      rethrow;
    }
  }
}