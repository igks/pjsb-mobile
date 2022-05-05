part of 'models.dart';

class Content {
  late int id;
  late int contentId;
  late int section;
  late String thumbnail;
  late String videoUrl;
  late String title;

  Content(
      {required this.id,
      required this.contentId,
      required this.section,
      required this.thumbnail,
      required this.videoUrl,
      required this.title});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
      id: json["id"],
      contentId: json["content_id"],
      section: json["section"],
      thumbnail: json["thumbnail"],
      videoUrl: json["video_url"],
      title: json["title"]);
}
