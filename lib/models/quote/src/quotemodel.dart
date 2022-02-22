class QuoteModel {
  final List tags;
  final String id;
  final String content;
  final String author;
  final String authorSlug;
  final int length;
  final String dateadded;
  final String datemodified;
  QuoteModel(
      {this.tags = const [],
      this.id = "",
      this.content = "",
      this.author = "",
      this.authorSlug = "",
      this.length = 0,
      this.dateadded = "",
      this.datemodified = ""});

  factory QuoteModel.fromJson(Map json) {
    return QuoteModel(
        tags: json["tags"],
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateadded: json["dateAdded"],
        datemodified: json["dateModified"]);
  }
}
