import 'package:shared_preferences/shared_preferences.dart';

import '../models/track.dart';
import 'tracks_data_api.dart';

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
    var tracksIds = await bookmarks;
    return tracksIds.any((id) => id == trackId);
  }

  static Future<List<Track>> get bookmarkedTracks async {
    List<String> trackIds = await SharedPreferencesData.bookmarks;
    List<Track> tracks = [];
    for (var i = 0; i < trackIds.length; i++) {
      tracks.add(await TracksData.fetchTrack(trackIds[i]));
    }
    return tracks;
  }
}
