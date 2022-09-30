import 'package:flutter/material.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';
import 'package:reddit_flutterdev_viewer/post_viewer/models/reddit_post.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.data,
    required this.onTap,
    required this.index,
  });

  final RedditPost data;
  final int index;
  final Function(RedditPost data) onTap;

  @override
  Widget build(BuildContext context){
    return Material(
      color: AppColors.bg,
      borderRadius: AppConstants.borderRadius,
      child: InkWell(
        onTap: () => onTap(data),
        borderRadius: AppConstants.borderRadius,
        splashColor: AppColors.primary,
        highlightColor: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.spaceM, vertical: AppConstants.spaceL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title, style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: AppConstants.spaceS),
              data.thumbnail != null ? Image.network(data.thumbnail as String) : const SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}