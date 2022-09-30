import 'package:flutter/material.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';
import 'package:reddit_flutterdev_viewer/post_viewer/models/reddit_post.dart';
import 'package:reddit_flutterdev_viewer/shared/widgets/app_bar.dart';
import 'package:reddit_flutterdev_viewer/shared/widgets/icon_label.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({
    super.key,
    required this.data,
  });

  final RedditPost data;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: customAppBar("Post detail"),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: AppConstants.screenPadding,
          child: Column(
            children: [
              Text(data.title, style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: AppConstants.spaceM),
              Text(data.selftext, style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(height: AppConstants.spaceM),
              Align(
                alignment: Alignment.centerRight,
                child: IconLabel(
                  icon: Icons.thumb_up_outlined, 
                  text: "+${data.ups}"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}