class RedditPost {
  const RedditPost({
    required this.id,
    required this.title,
    required this.selftext,
    required this.thumbnail,
    required this.ups,
  });

  final String id;
  final String title;
  final String selftext;
  final String? thumbnail;
  final int ups;

  factory RedditPost.fromAnother(RedditPost post) {
    return RedditPost(
      id: post.id, 
      title: post.title, 
      selftext: post.selftext, 
      thumbnail: post.thumbnail, 
      ups: post.ups
    );
  }

  factory RedditPost.fromJson(Map<String, dynamic> json) {
    final id = json["id"] as String;
    final title = json["title"] as String;
    final selftext = json["selftext"] as String;
    String? thumbnail = json["thumbnail"] as String?;
    if (
      thumbnail != null && (
        thumbnail == "self" || !(
          thumbnail.startsWith("http://") || 
          thumbnail.startsWith("http://")
        ))
    ) {
      thumbnail = null;
    }
    final ups = json["ups"] as int;

    return RedditPost(
      id: id,
      title: title, 
      selftext: selftext, 
      thumbnail: thumbnail, 
      ups: ups
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "selftext": selftext,
    "thumbnail": thumbnail,
    "ups": ups,
  };
}