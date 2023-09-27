class NewsModel {
  String title;
  String description;
  String imageUrl;
  String content;
  String? author;
  String? publishedat;

  NewsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content,
    this.author,
    this.publishedat,
  });

  factory NewsModel.fromMap({required Map data}) {
    return NewsModel(
      title: data['articles'][0]['title'],
      description: data['articles'][0]['description'],
      imageUrl: data['articles'][0]['urlToImage'],
      content: data['articles'][0]['content'],
      author: data['articles'][0]['author'],
      publishedat: data['articles'][0]['publishedAt'],
    );
  }
}
