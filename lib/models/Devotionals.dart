class Devotionals {
  final int? id;
  final String? title, thumbnail;
  final String? author, content, biblereading, confession, studies;
  final String? french_title, french_bible_reading, french_content, french_confession, french_studies;
  final String? german_title, german_bible_reading, german_content, german_confession, german_studies;

  Devotionals(
      {this.id,
      this.title,
      this.thumbnail,
      this.author,
      this.content,
      this.biblereading,
      this.confession,
      this.studies,

      this.french_title,
      this.french_bible_reading,
      this.french_content,
      this.french_confession,
      this.french_studies,

       this.german_title,
       this.german_bible_reading,
      this.german_content,
      this.german_confession,
      this.german_studies
      });

  factory Devotionals.fromJson(Map<String, dynamic> json) {
    //print(json);
    int id = int.parse(json['id'].toString());
    return Devotionals(
      id: id,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      biblereading: json['bible_reading'] as String?,
      confession: json['confession'] as String?,
      studies: json['studies'] as String?,

      french_title: json['french_title'] as String?,
      french_bible_reading: json['french_bible_reading'] as String?,
      french_content: json['french_content'] as String?,
      french_confession: json['french_confession'] as String?,
      french_studies: json['french_studies'] as String?,

      german_title: json['german_title'] as String?,
      german_bible_reading: json['german_bible_reading'] as String?,
      german_content: json['german_content'] as String?,
      german_confession: json['german_confession'] as String?,
      german_studies: json['german_studies'] as String?,
    );
  }
}

 class TranslatedItem{
   final String? detected_source_language;
   final String? text;

   TranslatedItem({this.text, this.detected_source_language});

   factory TranslatedItem.fromJson(Map<String, dynamic> json) {
     return TranslatedItem(
       detected_source_language: json['detected_source_language'] as String?,
       text: json['text'] as String?
     );
   }
 }