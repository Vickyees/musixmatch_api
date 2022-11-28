import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  static Future bookmarkTrack(String trackId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList('bookmarked_tracks') ?? [];
    if (items.contains(trackId)) {
      return;
    }
    await prefs.setStringList('bookmarked_tracks', <String>[...items, trackId]);
  }

  static Future unBookmarkTrack(String trackId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> items = prefs.getStringList('bookmarked_tracks') ?? [];
    items.remove(trackId);
    await prefs.setStringList('bookmarked_tracks', items);
  }

  static Future<List<String>> get bookmarks async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('bookmarked_tracks') ?? [];
  }

  static Future<bool> checkBookmarked(String trackId) async {
    var tracks_ids = await bookmarks;
    return tracks_ids.any((id) => id == trackId);
  }
}
