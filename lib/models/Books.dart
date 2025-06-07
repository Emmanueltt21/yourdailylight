import '../providers/NewsScreensModel.dart';

class Books {
  final int? id;
  final String? b_name, b_title, b_desc, thumbnail, bookUrl ;
  final String?  downloadUrl, author, date, uti, utimo;
  final String? amount, is_free, category;

Books(
      {this.id,
      this.category,
      this.b_title,
      this.thumbnail,
      this.b_name,
      this.bookUrl,
      this.downloadUrl,
      this.author,
      this.date,
      this.b_desc,
      this.uti,
      this.utimo,
      this.is_free,
      this.amount,
     });




  factory Books.fromJson(Map<String, dynamic> json) {
    //print(json);
    int id = int.parse(json['id'].toString());
    return Books(
        id: id,
        category: json['category'] as String?,
      b_title: json['b_title'] as String?,
      b_name: json['b_name'] as String?,
      b_desc: json['b_desc'] as String?,
      thumbnail: json['thumbnail'] as String?,
      bookUrl: json['book_url'] as String?,
      is_free: json['is_free'] as String?,
        downloadUrl: json['url'] as String?,
      author: json['uti'] as String?,
      date: json['dou'] as String?,
      uti: json['uti'] as String?,
      utimo: json['utimo'] as String?,
      amount: json['amount'] as String?,
    );
  }

  factory Books.fromMap(Map<String, dynamic> data) {
    return Books(
        id: data['id'],
        category: data['category'],
        b_title: data['cat_id'],
        b_name: data['b_name'],
        bookUrl: data['book_url'],
        thumbnail: data['thumbnail'],
        downloadUrl: data['downloadUrl'],
        author: data['uti'],
        b_desc: data['b_desc'],
        date: data['dou'],
        is_free: data['is_free'],
        uti: data['uti'],
        utimo: data['utimo'],
        amount: data['amount']);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "category": category,
        "title": b_title,
        "thumbnail": thumbnail,
        "content": b_desc,
        "downloadUrl": downloadUrl,

      };
}
