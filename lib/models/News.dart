import '../providers/NewsScreensModel.dart';


extension NewsCopyWith on News {
  News copyWith({
    int? id,
    String? category,
    String? cat_id,
    String? title,
    String? thumbnail,
    String? mediaType,
    String? content,
    String? french_content,
    String? french_title,
    String? german_title,
    String? german_content,
    String? downloadUrl,
    String? author,
    String? date,
    String? dmo,
    String? uti,
    String? utimo,
    String? views_count,
  }) {
    return News(
      id: id ?? this.id,
      category: category ?? this.category,
      cat_id: cat_id ?? this.cat_id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      mediaType: mediaType ?? this.mediaType,
      content: content ?? this.content,
      french_content: french_content ?? this.french_content,
      french_title: french_title ?? this.french_title,
      german_title: german_title ?? this.german_title,
      german_content: german_content ?? this.german_content,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      author: author ?? this.author,
      date: date ?? this.date,
      dmo: dmo ?? this.dmo,
      uti: uti ?? this.uti,
      utimo: utimo ?? this.utimo,
      views_count: views_count ?? this.views_count,
    );
  }
}

class News {
  final int? id;
 // int? commentsCount, likesCount, previewDuration, duration, viewsCount;
  final String? category, title, thumbnail, mediaType, cat_id;
  final String?  downloadUrl, author, date, dmo, uti, utimo, views_count;
  //final bool? canPreview, canDownload, isFree, http;
 // bool? userLiked;
  final String? content, french_content, german_content, french_title, german_title;


  News(
      {this.id,
      this.category,
      this.cat_id,
      this.title,
      this.thumbnail,
      this.mediaType,
      this.content,
      this.downloadUrl,
      this.author,
      this.date,
      this.dmo,
      this.uti,
      this.utimo,
      this.views_count,
      this.french_content,
      this.french_title,
      this.german_title,
      this.german_content,
     });




  factory News.fromJson(Map<String, dynamic> json) {
    //print(json);
    int id = int.parse(json['id'].toString());
    return News(
        id: id,
        category: json['category'] as String?,
      cat_id: json['cat_id'] as String?,
        title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
        mediaType: json['type'] as String?,
      content: json['content'] as String?,
      french_content: json['french_content'] as String?,
      german_content: json['german_content'] as String?,
      french_title: json['french_title'] as String?,
      german_title: json['german_title'] as String?,
        downloadUrl: json['download_url'] as String?,
      author: json['author'] as String?,
      date: json['init_date'] as String?,
      //date: json['date'] as String?,
      dmo: json['dmo'] as String?,
      uti: json['uti'] as String?,
      utimo: json['utimo'] as String?,
      views_count: json['views_count'].toString() as String?,
    );
  }

  factory News.fromMap(Map<String, dynamic> data) {
    return News(
        id: data['id'],
        category: data['category'],
        cat_id: data['cat_id'],
        title: data['title'],
        thumbnail: data['thumbnail'],
        mediaType: data['mediaType'],
        content: data['content'],
        french_content: data['french_content'],
        french_title: data['french_title'],
        german_title: data['german_title'],
        german_content: data['german_content'],
        downloadUrl: data['downloadUrl']);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "category": category,
        "title": title,
        "thumbnail": thumbnail,
        "mediaType": mediaType,
        "content": content,
        "french_content": french_content,
        "french_title": french_title,
        "german_title": german_title,
        "german_content": german_content,
        "downloadUrl": downloadUrl,

      };
}
