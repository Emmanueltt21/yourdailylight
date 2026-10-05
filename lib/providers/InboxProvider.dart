import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Inbox.dart';
import '../service/NotificationManager.dart';
import '../utils/ApiUrl.dart';

class InboxProvider extends ChangeNotifier {
  List<Inbox> _items = [];
  Set<int> _readIds = {};
  bool isLoading = false;
  bool isError = false;
  int _page = 0;
  bool isLastPage = false;

  List<Inbox> get items => _items;
  Set<int> get readIds => _readIds;

  int get unreadCount {
    return _items.where((item) => !_readIds.contains(item.id)).length;
  }

  bool isRead(int id) => _readIds.contains(id);

  InboxProvider() {
    _loadReadIds();
  }

  Future<void> updateAppBadge() async {
    await NotificationManager.updateAppBadge(unreadCount);
  }

  Future<void> _loadReadIds() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('inbox_read_ids') ?? [];
    _readIds = stored.map((e) => int.tryParse(e) ?? -1).toSet();
    await updateAppBadge();
    notifyListeners();
  }

  Future<void> _saveReadIds() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'inbox_read_ids',
      _readIds.map((e) => e.toString()).toList(),
    );
  }

  Future<void> markAsRead(int id) async {
    if (_readIds.contains(id)) return;
    _readIds.add(id);
    await _saveReadIds();
    await updateAppBadge();
    notifyListeners();
  }

  Future<void> markAllAsRead() async {
    bool changed = false;
    for (final item in _items) {
      if (item.id != null && !_readIds.contains(item.id)) {
        _readIds.add(item.id!);
        changed = true;
      }
    }
    if (changed) {
      await _saveReadIds();
      await updateAppBadge();
      notifyListeners();
    }
  }

  Future<void> loadItems() async {
    _page = 0;
    isLastPage = false;
    isLoading = true;
    isError = false;
    notifyListeners();

    try {
      final dio = Dio();
      final response = await dio.post(
        ApiUrl.INBOX,
        data: jsonEncode({"data": {"page": "0"}}),
      );

      if (response.statusCode == 200) {
        dynamic res = jsonDecode(response.data);
        List<Inbox> fetched = _parseInbox(res);
        isLastPage = res['isLastPage'] == true;
        _items = fetched;
        await updateAppBadge();
      } else {
        isError = true;
      }
    } catch (e) {
      print('InboxProvider loadItems error: $e');
      isError = true;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadMoreItems() async {
    if (isLastPage) return;
    _page++;
    try {
      final dio = Dio();
      final response = await dio.post(
        ApiUrl.INBOX,
        data: jsonEncode({"data": {"page": _page.toString()}}),
      );

      if (response.statusCode == 200) {
        dynamic res = jsonDecode(response.data);
        List<Inbox> more = _parseInbox(res);
        isLastPage = res['isLastPage'] == true;
        _items.addAll(more);
        await updateAppBadge();
        notifyListeners();
      }
    } catch (e) {
      print('InboxProvider loadMoreItems error: $e');
      _page--;
    }
  }

  static List<Inbox> _parseInbox(dynamic res) {
    final parsed = (res["inbox"] as List).cast<Map<String, dynamic>>();
    return parsed.map<Inbox>((json) => Inbox.fromJson(json)).toList();
  }
}
