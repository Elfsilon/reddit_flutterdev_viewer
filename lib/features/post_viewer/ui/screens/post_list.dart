import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/models/reddit_post.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/ui/controllers/post_list_controller.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/ui/screens/post_detail.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/ui/widgets/post.dart';
import 'package:reddit_flutterdev_viewer/shared/widgets/app_bar.dart';
import 'package:reddit_flutterdev_viewer/shared/widgets/choice.dart';
import 'package:reddit_flutterdev_viewer/shared/widgets/snackbar.dart';

class PostListScreen extends ConsumerStatefulWidget {
  const PostListScreen({
    super.key,
  });

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends ConsumerState<PostListScreen> {
  @override
  void initState() {
    loadPosts();
    super.initState();
  }

  Future<void> loadPosts() async {
    final controller = ref.read(postListControllerProvider.notifier);
    await controller.getPosts();
  }

  Future<void> refreshPosts() async {
    final controller = ref.read(postListControllerProvider.notifier);
    await controller.refreshPosts();
  }

  void onPostTap(RedditPost data) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => PostDetail(data: data),
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postListControllerProvider);

    ref.listen(postListControllerProvider, (_, state) {
      state.whenOrNull(error: (error, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackbar(error.toString())
        );
      });
    });

    return Scaffold(
      appBar: customAppBar("Posts"),
      body: state.when(
        data: (data) => Choice(
          condition: data.items.isNotEmpty,
          baseChild: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: refreshPosts,
                    child: ListView.separated(
                      padding: AppConstants.screenPadding,
                      itemBuilder: (_, index) => Post(index: index, onTap: onPostTap, data: data.items[index]),
                      separatorBuilder: (_, __) => const SizedBox(height: AppConstants.spaceM),
                      itemCount: data.items.length,
                    ),
                  ), 
                ),
              ],
            ),
          ),
          altChild: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("No posts to display", style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: AppConstants.spaceS),
                ElevatedButton(
                  onPressed: loadPosts, 
                  child: const Text("Refresh"),
                ),
              ],
            ),
          ),
        ),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 100),
              const SizedBox(height: AppConstants.spaceS),
              Text("Oops... Something went wrong!", style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: AppConstants.spaceM),
              ElevatedButton(
                onPressed: loadPosts, 
                child: const Text("Refresh"),
              ),
            ],
          ),
        ), 
        loading: () => const Center(
          child: CircularProgressIndicator()
        ),
      ),
    );
  }
}
