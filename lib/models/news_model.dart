class NewsModel {
  // String title;
  // String description;
  // String imageUrl;
  // String content;
  // String? author;
  // String? publishedat;
  List articles;

  NewsModel({
    // required this.title,
    // required this.description,
    // required this.imageUrl,
    // required this.content,
    // this.author,
    // this.publishedat,
required this.articles
  });

  factory NewsModel.fromMap({required Map data}) {
    return NewsModel(
      // title: data['title'],
      // description: data['description'],
      // imageUrl: data['urlToImage'],
      // content: data['articles'][0]['content'],
      // author: data['articles'][0]['author'],
      // publishedat: data['articles'][0]['publishedAt'],
      articles: data['articles']
    );
  }
}
