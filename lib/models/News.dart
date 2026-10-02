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
    String? italian_title,
    String? italian_content,
    String? spanish_title,
    String? spanish_content,
    String? hindi_title,
    String? hindi_content,
    String? russian_title,
    String? russian_content,
    String? portuguese_title,
    String? portuguese_content,
    String? mandarin_title,
    String? mandarin_content,
    String? downloadUrl,
    String? author,
    String? date,
    String? dmo,
    String? uti,
    String? utimo,
    String? views_count,
    String? initDate,
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
      italian_title: italian_title ?? this.italian_title,
      italian_content: italian_content ?? this.italian_content,
      spanish_title: spanish_title ?? this.spanish_title,
      spanish_content: spanish_content ?? this.spanish_content,
      hindi_title: hindi_title ?? this.hindi_title,
      hindi_content: hindi_content ?? this.hindi_content,
      russian_title: russian_title ?? this.russian_title,
      russian_content: russian_content ?? this.russian_content,
      portuguese_title: portuguese_title ?? this.portuguese_title,
      portuguese_content: portuguese_content ?? this.portuguese_content,
      mandarin_title: mandarin_title ?? this.mandarin_title,
      mandarin_content: mandarin_content ?? this.mandarin_content,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      author: author ?? this.author,
      date: date ?? this.date,
      dmo: dmo ?? this.dmo,
      uti: uti ?? this.uti,
      utimo: utimo ?? this.utimo,
      views_count: views_count ?? this.views_count,
      initDate: initDate ?? this.initDate,
    );
  }
}

class News {
  final int? id;
 // int? commentsCount, likesCount, previewDuration, duration, viewsCount;
  final String? category, title, thumbnail, mediaType, cat_id;
  final String?  downloadUrl, author, date, dmo, uti, utimo, views_count, initDate;
  //final bool? canPreview, canDownload, isFree, http;
 // bool? userLiked;
  final String? content, french_content, german_content, french_title, german_title;
  final String? italian_title, italian_content;
  final String? spanish_title, spanish_content;
  final String? hindi_title, hindi_content;
  final String? russian_title, russian_content;
  final String? portuguese_title, portuguese_content;
  final String? mandarin_title, mandarin_content;


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
      this.italian_title,
      this.italian_content,
      this.spanish_title,
      this.spanish_content,
      this.hindi_title,
      this.hindi_content,
      this.russian_title,
      this.russian_content,
      this.portuguese_title,
      this.portuguese_content,
      this.mandarin_title,
      this.mandarin_content,
      this.initDate,
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
      italian_title: json['italian_title'] as String?,
      italian_content: json['italian_content'] as String?,
      spanish_title: json['spanish_title'] as String?,
      spanish_content: json['spanish_content'] as String?,
      hindi_title: json['hindi_title'] as String?,
      hindi_content: json['hindi_content'] as String?,
      russian_title: json['russian_title'] as String?,
      russian_content: json['russian_content'] as String?,
      portuguese_title: json['portuguese_title'] as String?,
      portuguese_content: json['portuguese_content'] as String?,
      mandarin_title: json['mandarin_title'] as String?,
      mandarin_content: json['mandarin_content'] as String?,
        downloadUrl: json['download_url'] as String?,
      author: json['author'] as String?,
      date: json['init_date'] as String?,
      //date: json['date'] as String?,
      dmo: json['dmo'] as String?,
      uti: json['uti'] as String?,
      utimo: json['utimo'] as String?,
      views_count: json['views_count']?.toString(),
      initDate: json['init_date'] as String?,
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
        italian_title: data['italian_title'],
        italian_content: data['italian_content'],
        spanish_title: data['spanish_title'],
        spanish_content: data['spanish_content'],
        hindi_title: data['hindi_title'],
        hindi_content: data['hindi_content'],
        russian_title: data['russian_title'],
        russian_content: data['russian_content'],
        portuguese_title: data['portuguese_title'],
        portuguese_content: data['portuguese_content'],
        mandarin_title: data['mandarin_title'],
        mandarin_content: data['mandarin_content'],
        downloadUrl: data['downloadUrl'],
        initDate: data['init_date']);
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
        "italian_title": italian_title,
        "italian_content": italian_content,
        "spanish_title": spanish_title,
        "spanish_content": spanish_content,
        "hindi_title": hindi_title,
        "hindi_content": hindi_content,
        "russian_title": russian_title,
        "russian_content": russian_content,
        "portuguese_title": portuguese_title,
        "portuguese_content": portuguese_content,
        "mandarin_title": mandarin_title,
        "mandarin_content": mandarin_content,
        "downloadUrl": downloadUrl,
        "initDate": initDate,
      };
}

