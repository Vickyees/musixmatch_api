import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musixmatch_api/database/shared_preferences_data.dart';
import 'package:musixmatch_api/database/tracks_data_api.dart';

class BookmarksPage extends StatefulWidget {
  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late Future<List> bookmarks;

  Future<List> get bookmarkedTracks async {
    List<String> track_ids = await SharedPreferencesData.bookmarks;
    var tracks = [];
    for (var i = 0; i < track_ids.length; i++) {
      tracks.add(await TracksDataApi.fetchTrack(track_ids[i]));
    }
    return tracks;
  }

  @override
  void initState() {
    bookmarks = bookmarkedTracks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: bookmarkedTracks,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final tracks = snapshot.data!;
        if (tracks.isEmpty) {
          return Center(
            child: Text("No bookmarks!"),
          );
        }
        return ListView.builder(
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tracks[index]['track']['track_name'].toString()),
              subtitle: Text(tracks[index]['track']['artist_name'].toString()),
            );
          },
        );
      },
    );
  }
}
