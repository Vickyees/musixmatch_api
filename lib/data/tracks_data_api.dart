import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:musixmatch_api/data/shared_preferences_data.dart';
import 'package:musixmatch_api/models/track.dart';

class TracksData {
  static Future<Track> fetchTrack(String trackId) async {
    String url =
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=18a9c915ca84b55d148d06f6f48d953e";

    var result = await http.get(Uri.parse(url));
    var track = json.decode(result.body)['message']['body']['track'];
    var lyrics = await fetchTrackLyrics(trackId);
    var trackModel = Track(
        trackId: track['track_id'].toString(),
        trackName: track['track_name'],
        translationList: track['track_name_translation_list'],
        rating: track['track_rating'],
        hasSubtitles: track['has_subtitles'] == 1 ? true : false,
        hasLyrics: track['has_lyrics'] == 1 ? true : false,
        lyrics: lyrics,
        albumId: track['album_id'].toString(),
        albumName: track['album_name'],
        artistId: track['artist_id'].toString(),
        artistName: track['artist_name']);

    return trackModel;
  }

  static Future<Track> getTrackDetails(String trackId) async {
    var track = await TracksData.fetchTrack(trackId);
    track.isBookmarked = await SharedPreferencesData.checkBookmarked(trackId);
    return track;
  }

  static Future<String> fetchTrackLyrics(String trackId) async {
    String url =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=18a9c915ca84b55d148d06f6f48d953e";
    var result = await http.get(Uri.parse(url));
    var lyrics = json.decode(result.body)['message']['body'];
    return lyrics['lyrics']['lyrics_body'];
  }

  static Future<List<Track>> get fetchTracks async {
    String url =
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=18a9c915ca84b55d148d06f6f48d953e";
    var response = await http.get(Uri.parse(url));
    var result = json.decode(response.body)['message']['body']['track_list'];
    List tracks_with_lyrics =
        result.where((track) => track['track']['has_lyrics'] == 1).toList();
    List<Track> tracks = tracks_with_lyrics
        .map((track) => Track.fromJson(track['track']))
        .toList();
    return tracks;
  }
}
