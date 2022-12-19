class ForumPostModel {
  String id;
  String createdBy;
  DateTime createdAt;
  String text;

  ForumPostModel({
    required this.id,
    required this.createdBy,
    required this.createdAt,
    required this.text,
  });
}
