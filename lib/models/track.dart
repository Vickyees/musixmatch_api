class Track {
  final String trackId;
  final String trackName;
  final List translationList;
  final int rating;
  final bool hasSubtitles;
  final bool hasLyrics;
  final String? lyrics;
  final String albumId;
  final String albumName;
  final String artistId;
  final String artistName;
  bool? isBookmarked;

  Track({
    required this.trackId,
    required this.trackName,
    required this.translationList,
    required this.rating,
    required this.hasSubtitles,
    required this.hasLyrics,
    this.lyrics,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    this.isBookmarked,
  });
  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      trackId: json['track_id'].toString(),
      trackName: json['track_name'],
      translationList: json['track_name_translation_list'],
      rating: json['track_rating'],
      hasSubtitles: json['has_subtitles'] == 1 ? true : false,
      hasLyrics: json['has_lyrics'] == 1 ? true : false,
      albumId: json['album_id'].toString(),
      albumName: json['album_name'],
      artistId: json['artist_id'].toString(),
      artistName: json['artist_name'],
    );
  }
}
