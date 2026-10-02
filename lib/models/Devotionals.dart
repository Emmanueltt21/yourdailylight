class Devotionals {
  final int? id;
  final String? title, thumbnail;
  final String? author, content, biblereading, confession, studies;

  // French
  final String? french_title;
  final String? french_bible_reading;
  final String? french_content;
  final String? french_confession;
  final String? french_studies;

  // German
  final String? german_title;
  final String? german_bible_reading;
  final String? german_content;
  final String? german_confession;
  final String? german_studies;

  // Italian
  final String? italian_title;
  final String? italian_bible_reading;
  final String? italian_content;
  final String? italian_confession;
  final String? italian_studies;

  // Spanish
  final String? spanish_title;
  final String? spanish_bible_reading;
  final String? spanish_content;
  final String? spanish_confession;
  final String? spanish_studies;

  // Hindi
  final String? hindi_title;
  final String? hindi_bible_reading;
  final String? hindi_content;
  final String? hindi_confession;
  final String? hindi_studies;

  // Russian
  final String? russian_title;
  final String? russian_bible_reading;
  final String? russian_content;
  final String? russian_confession;
  final String? russian_studies;

  // Portuguese
  final String? portuguese_title;
  final String? portuguese_bible_reading;
  final String? portuguese_content;
  final String? portuguese_confession;
  final String? portuguese_studies;

  // Mandarin Chinese
  final String? mandarin_title;
  final String? mandarin_bible_reading;
  final String? mandarin_content;
  final String? mandarin_confession;
  final String? mandarin_studies;

  Devotionals({
    this.id,
    this.title,
    this.thumbnail,
    this.author,
    this.content,
    this.biblereading,
    this.confession,
    this.studies,

    // French
    this.french_title,
    this.french_bible_reading,
    this.french_content,
    this.french_confession,
    this.french_studies,

    // German
    this.german_title,
    this.german_bible_reading,
    this.german_content,
    this.german_confession,
    this.german_studies,

    // Italian
    this.italian_title,
    this.italian_bible_reading,
    this.italian_content,
    this.italian_confession,
    this.italian_studies,

    // Spanish
    this.spanish_title,
    this.spanish_bible_reading,
    this.spanish_content,
    this.spanish_confession,
    this.spanish_studies,

    // Hindi
    this.hindi_title,
    this.hindi_bible_reading,
    this.hindi_content,
    this.hindi_confession,
    this.hindi_studies,

    // Russian
    this.russian_title,
    this.russian_bible_reading,
    this.russian_content,
    this.russian_confession,
    this.russian_studies,

    // Portuguese
    this.portuguese_title,
    this.portuguese_bible_reading,
    this.portuguese_content,
    this.portuguese_confession,
    this.portuguese_studies,

    // Mandarin
    this.mandarin_title,
    this.mandarin_bible_reading,
    this.mandarin_content,
    this.mandarin_confession,
    this.mandarin_studies,
  });

  factory Devotionals.fromJson(Map<String, dynamic> json) {
    int id = int.parse(json['id'].toString());

    return Devotionals(
      id: id,

      // English
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      biblereading: json['bible_reading'] as String?,
      confession: json['confession'] as String?,
      studies: json['studies'] as String?,

      // French
      french_title: json['french_title'] as String?,
      french_bible_reading: json['french_bible_reading'] as String?,
      french_content: json['french_content'] as String?,
      french_confession: json['french_confession'] as String?,
      french_studies: json['french_studies'] as String?,

      // German
      german_title: json['german_title'] as String?,
      german_bible_reading: json['german_bible_reading'] as String?,
      german_content: json['german_content'] as String?,
      german_confession: json['german_confession'] as String?,
      german_studies: json['german_studies'] as String?,

      // Italian
      italian_title: json['italian_title'] as String?,
      italian_bible_reading: json['italian_bible_reading'] as String?,
      italian_content: json['italian_content'] as String?,
      italian_confession: json['italian_confession'] as String?,
      italian_studies: json['italian_studies'] as String?,

      // Spanish
      spanish_title: json['spanish_title'] as String?,
      spanish_bible_reading: json['spanish_bible_reading'] as String?,
      spanish_content: json['spanish_content'] as String?,
      spanish_confession: json['spanish_confession'] as String?,
      spanish_studies: json['spanish_studies'] as String?,

      // Hindi
      hindi_title: json['hindi_title'] as String?,
      hindi_bible_reading: json['hindi_bible_reading'] as String?,
      hindi_content: json['hindi_content'] as String?,
      hindi_confession: json['hindi_confession'] as String?,
      hindi_studies: json['hindi_studies'] as String?,

      // Russian
      russian_title: json['russian_title'] as String?,
      russian_bible_reading: json['russian_bible_reading'] as String?,
      russian_content: json['russian_content'] as String?,
      russian_confession: json['russian_confession'] as String?,
      russian_studies: json['russian_studies'] as String?,

      // Portuguese
      portuguese_title: json['portuguese_title'] as String?,
      portuguese_bible_reading: json['portuguese_bible_reading'] as String?,
      portuguese_content: json['portuguese_content'] as String?,
      portuguese_confession: json['portuguese_confession'] as String?,
      portuguese_studies: json['portuguese_studies'] as String?,

      // Mandarin Chinese
      mandarin_title: json['mandarin_title'] as String?,
      mandarin_bible_reading: json['mandarin_bible_reading'] as String?,
      mandarin_content: json['mandarin_content'] as String?,
      mandarin_confession: json['mandarin_confession'] as String?,
      mandarin_studies: json['mandarin_studies'] as String?,
    );
  }
}


class TranslatedItem {
  final String? detected_source_language;
  final String? text;

  TranslatedItem({
    this.text,
    this.detected_source_language,
  });

  factory TranslatedItem.fromJson(Map<String, dynamic> json) {
    return TranslatedItem(
      detected_source_language:
          json['detected_source_language'] as String?,
      text: json['text'] as String?,
    );
  }
}
