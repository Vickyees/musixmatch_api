import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musixmatch_api/bookmark_button.dart';
import 'package:musixmatch_api/database/shared_preferences_data.dart';
import 'package:musixmatch_api/database/tracks_data_api.dart';

class TrackDetailScreen extends StatelessWidget {
  static const routeName = "/track-details-screen";

  Future<Map> getTrackDetails(String trackId) async {
    var trackDetails = await TracksDataApi.fetchTrack(trackId);
    trackDetails['is_bookmarked'] =
        await SharedPreferencesData.checkBookmarked(trackId);
    print(trackDetails['is_bookmarked']);
    return trackDetails;
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;

    return FutureBuilder(
        future: getTrackDetails(id.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          final track = snapshot.data!['track'];
          return Scaffold(
            appBar: AppBar(
              actions: [
                BookmarkButton(snapshot.data!['is_bookmarked'],
                    track['track_id'].toString())
              ],
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    track['track_name'],
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    track['artist_name'],
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Track Details",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    // height: 500,
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      color: Colors.white38,
                      // ignore: prefer_const_constructors
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "ID: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['track_id'].toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ])),
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "Name: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['track_name'],
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ])),
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "Translation list: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['track_name_translation_list']
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ])),
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "Rating: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['track_rating'].toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ])),
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "Subtitles: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['has_subtitles'] == 1
                                      ? "Yes"
                                      : "No",
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ])),
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "Track translation list: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['track_name_translation_list']
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ]))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Track Lyrics",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    // height: 500,
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      color: Colors.white38,
                      // ignore: prefer_const_constructors
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data!['lyrics']),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Album Details",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    // height: 500,
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      color: Colors.white38,
                      // ignore: prefer_const_constructors
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "ID: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['album_id'].toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ])),
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "Name: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['album_name'].toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Artist Details",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    // height: 500,
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      color: Colors.white38,
                      // ignore: prefer_const_constructors
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "ID: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['artist_id'].toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ])),
                            Text.rich(TextSpan(children: [
                              // ignore: prefer_const_constructors
                              TextSpan(
                                  text: "Name: ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: track['artist_name'].toString(),
                                  style: TextStyle(
                                    fontSize: 17,
                                  ))
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          );
        });
  }
}
