import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/foundation.dart';
import '../models/Hymns.dart';
import '../database/SQLiteDbProvider.dart';

class HymnsBookmarksModel with ChangeNotifier {
  List<Hymns> bookmarksList = [];

  HymnsBookmarksModel() {
    getBookmarks();
  }

  getBookmarks() async {
    bookmarksList = await SQLiteDbProvider.db.getAllBookmarkedHymns();
    notifyListeners();
  }

  bookmarkHymn(Hymns hymns) async {
    await SQLiteDbProvider.db.bookmarkHymn(hymns);
    getBookmarks();
  }

  unBookmarkHymn(Hymns hymns) async {
    await SQLiteDbProvider.db.deleteBookmarkedHymn(hymns.id);
    getBookmarks();
  }

  bool isHymnBookmarked(Hymns hymns) {
    Hymns? itm = bookmarksList.firstWhereOrNull((itm) => itm.id == hymns.id);
    return itm != null;
  }

  searchHymns(String term) {
    List<Hymns> _items = bookmarksList.where((hymns) {
      return hymns.title!.toLowerCase().contains(term.toLowerCase()) ||
          hymns.content!.toLowerCase().contains(term.toLowerCase());
    }).toList();
    bookmarksList = _items;
    notifyListeners();
  }
}
