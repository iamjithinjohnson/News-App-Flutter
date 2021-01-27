class ArticleModel {
  String title;
  String author;
  String source;

  String description;
  String urlToImage;
  DateTime publshedAt;
  String content;
  String articleUrl;

  ArticleModel(
      {this.title,
      this.description,
      this.author,
      this.source,
      this.content,
      this.publshedAt,
      this.urlToImage,
      this.articleUrl});
}
