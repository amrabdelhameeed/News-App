import 'source.dart';

class CategoryModel {
	Source? source;
	String? author;
	String? title;
	String? description;
	String? url;
	String? urlToImage;
	DateTime? publishedAt;
	String? content;

	CategoryModel({
		this.source, 
		this.author, 
		this.title, 
		this.description, 
		this.url, 
		this.urlToImage, 
		this.publishedAt, 
		this.content, 
	});

	factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
				source: json['source'] == null
						? null
						: Source.fromJson(json['source'] as Map<String, dynamic>),
				author: json['author'] as String?,
				title: json['title']==null ?"":json['title'] as String?,
				description: json['description']==null?"No Description":json['description'] as String?,
				url: json['url']==null ?"url":json['url'] as String?,
				urlToImage: json['urlToImage']==null?"":json['urlToImage'] as String?,
				publishedAt: json['publishedAt'] == null
						? null
						: DateTime.parse(json['publishedAt'] as String),
				content: json['content'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'source': source?.toJson(),
				'author': author,
				'title': title,
				'description': description,
				'url': url,
				'urlToImage': urlToImage,
				'publishedAt': publishedAt?.toIso8601String(),
				'content': content,
			};
}
