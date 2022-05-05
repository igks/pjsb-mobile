part of 'models.dart';

class Chapter {
  late int id;
  late int level;
  late int chapter;
  late String title;

  Chapter(
      {required this.id,
      required this.level,
      required this.chapter,
      required this.title});

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        level: json["level"],
        chapter: json["chapter"],
        title: json["title"],
      );
}
