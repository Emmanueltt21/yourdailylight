import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dio/dio.dart';
import '../models/Books.dart';
import '../models/News.dart';
import '../utils/ApiUrl.dart';
import '../models/Userdata.dart';

class BookStoreScreensModel with ChangeNotifier {
  bool isError = false;
  Userdata? userdata;
  List<Books>? mediaList = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  String apiURL = "";
  int page = 0;

  BookStoreScreensModel(Userdata? userdata) {
    this.mediaList = [];
    this.userdata = userdata;
  }

  loadItems() {
    refreshController.requestRefresh();
    page = 0;
    notifyListeners();
    fetchItems();
  }

  loadMoreItems() {
    page = page + 1;
    fetchItems();
  }

  void setItems(List<Books>? item) {
    mediaList!.clear();
    mediaList = item;
    refreshController.refreshCompleted();
    isError = false;
    notifyListeners();
  }

  void setMoreItems(List<Books> item) {
    mediaList!.addAll(item);
    refreshController.loadComplete();
    notifyListeners();
  }

  Future<void> fetchItems() async {
    try {
      /* var data = {
        "email": userdata == null ? "null" : userdata.email,
        "version": "v2",
        "page": page.toString(),
        "media_type": "audio"
      };
      final response =
          await http.post(ApiUrl.FETCH_MEDIA, body: jsonEncode({"data": data}));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        List<Media> mediaList = await compute(parseSliderMedia, response.body);
        if (page == 0) {
          setItems(mediaList);
        } else {
          setMoreItems(mediaList);
        }
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setFetchError();
      }*/
      final dio = Dio();
      print('MEDIA Content ---->> ${ApiUrl.GET_ALL_BOOKS}');
      print('MEDIA Content ---->> ${page.toString()}');

      final response = await dio.post(
        ApiUrl.GET_ALL_BOOKS,
        data: jsonEncode({
          "data": {
            "email": userdata == null ? "null" : userdata!.email,
            "version": "v2",
            "page": page.toString(),
            "media_type": "book"
          }
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        dynamic res = jsonDecode(response.data);
         print('NEWS res ---->> ${res}');

          // News.fromJson(res['news']);
     //  List<News>? mediaList = parseSliderMedia(res);
        List<Books>? mediaList = parseSliderMedia(res);
        if (page == 0) {
          setItems(mediaList);
        } else {
          setMoreItems(mediaList!);
        }
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        setFetchError();
      }
    } catch (exception) {
      // I get no exception here
      print(exception);
      setFetchError();
    }
  }

  static List<Books>? parseSliderMedia(dynamic res) {
    // final res = jsonDecode(responseBody);
    final parsed = res["books"].cast<Map<String, dynamic>>();
    return parsed.map<Books>((json) => Books.fromJson(json)).toList();
  }

  setFetchError() {
    if (page == 0) {
      isError = true;
      refreshController.refreshFailed();
      notifyListeners();
    } else {
      refreshController.loadFailed();
      notifyListeners();
    }
  }
}

