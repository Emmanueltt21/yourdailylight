import '../providers/NewsScreensModel.dart';

class PrayerRequestMdl {
  final int? id;
  final String? title, author, content, response, r_author ;
  final String?  dou, dmo;


  PrayerRequestMdl(
      {this.id,
      this.title,
      this.author,
      this.content,
      this.response,
      this.r_author,
      this.dou,
      this.dmo
     });




  factory PrayerRequestMdl.fromJson(Map<String, dynamic> json) {
    //print(json);
    int id = int.parse(json['id'].toString());
    return PrayerRequestMdl(
        id: id,
      title: json['title'] as String?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      response: json['response'] as String?,
      r_author: json['r_author'] as String?,
      dou: json['dou'] as String?,
      dmo: json['dmo'] as String?
    );
  }

  factory PrayerRequestMdl.fromMap(Map<String, dynamic> data) {
    return PrayerRequestMdl(
        id: data['id'],
        title: data['title'],
        author: data['author'],
        content: data['content'],
        response: data['response'],
        r_author: data['r_author'],
        dou: data['dou'],
        dmo: data['dmo'],
       );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "author": author,
        "content": content,
        "response": response,
        "r_author": r_author,

      };
}
