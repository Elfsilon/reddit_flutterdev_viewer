class RedditPost {
  const RedditPost({
    required this.id,
    required this.title,
    required this.selftext,
    required this.thumbnail,
    required this.author,
    required this.linkFlairText,
    required this.ups,
  });

  final String id;
  final String title;
  final String selftext;
  final String? thumbnail;
  final String author;
  final String linkFlairText;
  final int ups;

  factory RedditPost.fromAnother(RedditPost post) {
    return RedditPost(
      id: post.id, 
      title: post.title, 
      selftext: post.selftext, 
      thumbnail: post.thumbnail,
      author: post.author,
      linkFlairText: post.linkFlairText,
      ups: post.ups
    );
  }

  factory RedditPost.fromJson(Map<String, dynamic> json) {
    final id = json["id"] as String;
    final title = json["title"] as String;
    final selftext = json["selftext"] as String;
    final author = json["author"] as String;
    final linkFlairText = json["link_flair_text"] as String;
    final ups = json["ups"] as int;

    String? thumbnail = json["thumbnail"] as String?;
    if (
      thumbnail != null && (
        thumbnail == "self" || !(
          thumbnail.startsWith("https://") || 
          thumbnail.startsWith("http://")
        ))
    ) {
      thumbnail = null;
    }

    return RedditPost(
      id: id,
      title: title, 
      selftext: selftext, 
      thumbnail: thumbnail, 
      author: author,
      linkFlairText: linkFlairText,
      ups: ups
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "selftext": selftext,
    "thumbnail": thumbnail,
    "author": author,
    "link_flair_text": linkFlairText,
    "ups": ups,
  };
}