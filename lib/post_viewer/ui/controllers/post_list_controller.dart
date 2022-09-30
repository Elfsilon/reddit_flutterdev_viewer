import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutterdev_viewer/post_viewer/models/reddit_post_list.dart';
import 'package:reddit_flutterdev_viewer/post_viewer/services/reddit_post_service.dart';

final postListControllerProvider = 
  StateNotifierProvider.autoDispose<PostListController, AsyncValue<RedditPostList>>(
    (ref) => PostListController(
      postService: ref.watch(redditPostServiceProvider),
    )
  );

class PostListController extends StateNotifier<AsyncValue<RedditPostList>> {
  PostListController({ required this.postService }): 
    super(const AsyncValue.data(RedditPostList(items: [])));

  final RedditPostService postService;

  Future<void> getPosts() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => postService.getPosts());
  }

  Future<void> refreshPosts() async {
    try {
      final RedditPostList? currentPosts = state.value;
      if (currentPosts != null) {
        state = await AsyncValue.guard(() => postService.refreshPosts(currentPosts));
      }
    } catch (err, stack) {
      state = AsyncValue.error(err, stackTrace: stack);
    }
  }
}