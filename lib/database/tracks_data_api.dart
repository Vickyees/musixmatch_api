import 'dart:convert';

import 'package:http/http.dart' as http;

class TracksDataApi {
  static Future<Map> fetchTrack(String trackId) async {
    String url =
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=18a9c915ca84b55d148d06f6f48d953e";

    var result = await http.get(Uri.parse(url));
    var track = json.decode(result.body)['message']['body'];
    var lyrics = fetchTrackLyrics(trackId);
    track['lyrics'] = await lyrics;
    return track;
  }

  static Future<String> fetchTrackLyrics(String trackId) async {
    String url =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=18a9c915ca84b55d148d06f6f48d953e";
    var result = await http.get(Uri.parse(url));
    var lyrics = json.decode(result.body)['message']['body'];
    return lyrics['lyrics']['lyrics_body'];
  }
}

// musixmatch api base url
var varbase_url = "https://api.musixmatch.com/ws/1.1/";
// your api key
var api_key = "&apikey=18a9c915ca84b55d148d06f6f48d953e";

// api methods
var lyrics_matcher = "matcher.lyrics.get";
var lyrics_track_matcher = "track.lyrics.get";
var track_matcher = "matcher.track.get";
var subtitle_matcher = "matcher.subtitle.get";
var track_search = "track.search";
var artist_search = "artists.search";
var album_tracks = "album.tracks.get";
var track_charts = "chart.tracks.get";
var artist_charts = "chart.artists.get";
var related_artists = "artist.related.get";
var artist_album_getter = "artist.albums.get";
var track_getter = "track.get";
var artist_getter = "artist.get";
var album_getter = "album.get";
var subtitle_getter = "track.subtitle.get";
var snippet_getter = "track.snippet.get";
var api_methods = [
  lyrics_matcher,
  lyrics_track_matcher,
  track_matcher,
  subtitle_matcher,
  track_search,
  artist_search,
  album_tracks,
  track_charts,
  artist_charts,
  related_artists,
  artist_album_getter,
  track_getter,
  artist_getter,
  album_getter,
  subtitle_getter,
  snippet_getter
];

// format url
var format_url = "?format=json&callback=callback";

// parameters
var artist_search_parameter = "&q_artist=";
var track_search_parameter = "&q_track=";
var track_id_parameter = "&track_id=";
var artist_id_parameter = "&artist_id=";
var album_id_parameter = "&album_id=";
var has_lyrics_parameter = "&f_has_lyrics=";
var has_subtitle_parameter = "&f_has_subtitle=";
var page_parameter = "&page=";
var page_size_parameter = "&page_size=";
var word_in_lyrics_parameter = "&q_lyrics=";
var music_genre_parameter = "&f_music_genre_id=";
var music_language_parameter = "&f_lyrics_language=";
var artist_rating_parameter = "&s_artist_rating=";
var track_rating_parameter = "&s_track_rating=";
var quorum_factor_parameter = "&quorum_factor=";
var artists_id_filter_parameter = "&f_artist_id=";
var country_parameter = "&country=";
var release_date_parameter = "&s_release_date=";
var album_name_parameter = "&g_album_name=";
var paramaters = [
  artist_search_parameter,
  track_search_parameter,
  track_id_parameter,
  artist_id_parameter,
  album_id_parameter,
  has_lyrics_parameter,
  has_subtitle_parameter,
  page_parameter,
  page_size_parameter,
  word_in_lyrics_parameter,
  music_genre_parameter,
  music_language_parameter,
  artist_rating_parameter,
  track_rating_parameter,
  quorum_factor_parameter,
  artists_id_filter_parameter,
  country_parameter,
  release_date_parameter,
  album_name_parameter
];
// arrays with paramaters for each method
var lyrics_matcher_parameters = [
  artist_search_parameter,
  track_search_parameter
];
var lyrics_track_matcher_parameters = [track_id_parameter];
var track_matcher_parameters = [
  artist_search_parameter,
  track_search_parameter,
  has_lyrics_parameter,
  has_subtitle_parameter
];
var subtitle_matcher_parameters = [
  artist_search_parameter,
  track_search_parameter
];
var track_search_paramaters = [
  artist_search_parameter,
  track_search_parameter,
  word_in_lyrics_parameter,
  artist_id_parameter,
  music_genre_parameter,
  music_language_parameter,
  music_language_parameter,
  track_rating_parameter,
  quorum_factor_parameter,
  page_parameter,
  page_size_parameter
];
var artist_search_parameters = [
  artist_search_parameter,
  artists_id_filter_parameter,
  page_parameter,
  page_size_parameter
];
var album_tracks_parameters = [
  album_id_parameter,
  has_lyrics_parameter,
  page_parameter,
  page_size_parameter
];
var track_charts_paramaters = [
  page_parameter,
  page_size_parameter,
  country_parameter,
  has_lyrics_parameter
];
var artist_charts_parameters = [
  page_parameter,
  page_size_parameter,
  country_parameter
];
var related_artists_parameters = [
  artist_id_parameter,
  page_parameter,
  page_size_parameter
];
var artists_album_getter_paramaters = [
  artist_id_parameter,
  release_date_parameter,
  album_name_parameter,
  page_parameter,
  page_size_parameter
];
var track_getter_parameters = [track_id_parameter];
var artist_getter_parameters = [artist_id_parameter];
var album_getter_parameters = [album_id_parameter];
var subtitle_getter_parameters = [track_id_parameter];
var snippet_getter_parameters = [track_id_parameter];
var paramater_lists = [
  lyrics_matcher_parameters,
  lyrics_track_matcher_parameters,
  track_matcher_parameters,
  subtitle_matcher_parameters,
  track_search_paramaters,
  artist_search_parameters,
  album_tracks_parameters,
  track_charts_paramaters,
  artist_charts_parameters,
  related_artists_parameters,
  artists_album_getter_paramaters,
  track_getter_parameters,
  artist_getter_parameters,
  album_getter_parameters,
  subtitle_getter_parameters,
  snippet_getter_parameters
];

// get the paramaters for the correct api method
get_parameters(choice) {
  if (choice == lyrics_matcher) {
    return lyrics_matcher_parameters;
  }
  if (choice == lyrics_track_matcher) {
    return lyrics_track_matcher_parameters;
  }
  if (choice == track_matcher) {
    return track_matcher_parameters;
  }
  if (choice == subtitle_matcher) {
    return subtitle_matcher_parameters;
  }
  if (choice == track_search) {
    return track_search_paramaters;
  }
  if (choice == artist_search) {
    return artist_search_parameters;
  }
  if (choice == album_tracks) {
    return album_tracks_parameters;
  }
  if (choice == track_charts) {
    return track_charts_paramaters;
  }
  if (choice == artist_charts) {
    return artist_charts_parameters;
  }
  if (choice == related_artists) {
    return related_artists_parameters;
  }
  if (choice == artist_album_getter) {
    return artists_album_getter_paramaters;
  }
  if (choice == track_getter) {
    return track_getter_parameters;
  }
  if (choice == artist_getter) {
    return artist_getter_parameters;
  }
  if (choice == album_getter) {
    return album_getter_parameters;
  }
  if (choice == subtitle_getter) {
    return subtitle_getter_parameters;
  }
}
