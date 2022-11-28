import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:musixmatch_api/track_detail_screen.dart';

class TracksPage extends StatelessWidget {
  Future<List> get tracks async {
    String url =
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=18a9c915ca84b55d148d06f6f48d953e";
    var result = await http.get(Uri.parse(url));
    var tracks = json.decode(result.body)['message']['body'];
    return tracks['track_list'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tracks,
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final track_list = snapshot.data!;
        final tracks_with_lyrics = track_list.where((track) {
          return track['track']['has_lyrics'] == 1;
        }).toList();
        return ListView.builder(
          itemCount: tracks_with_lyrics.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(TrackDetailScreen.routeName,
                    arguments: tracks_with_lyrics[index]['track']['track_id']);
              },
              child: ListTile(
                title: Text(tracks_with_lyrics[index]['track']['track_name']
                    .toString()),
                subtitle: Text(tracks_with_lyrics[index]['track']['artist_name']
                    .toString()),
              ),
            );
          },
        );
      },
    );
  }
}
