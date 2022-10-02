import 'package:flutter/material.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/models/reddit_post.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/utils/get_post_label_colors.dart';
import 'package:reddit_flutterdev_viewer/shared/widgets/label.dart';

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
    final _labelColors = getLabelColors(data.linkFlairText);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColorLabel(text: data.linkFlairText, fgColor: _labelColors[0], bgColor: _labelColors[1]),
                  Text("u/${data.author}", style: Theme.of(context).textTheme.caption),
                ],
              ),
              const SizedBox(height: AppConstants.spaceS),
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