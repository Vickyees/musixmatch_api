import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch_api/widgets/bookmark_button.dart';
import 'package:musixmatch_api/data/tracks_data_api.dart';

import '../bloc/track_bloc.dart';

class TrackDetailScreen extends StatelessWidget {
  static const routeName = "/track-details-screen";

  const TrackDetailScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   final id = ModalRoute.of(context)!.settings.arguments as String;

  //   return FutureBuilder(
  //       future: TracksData.getTrackDetails(id.toString()),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(
  //             child: Scaffold(
  //               appBar: AppBar(),
  //               body: const Center(
  //                 child: CircularProgressIndicator(),
  //               ),
  //             ),
  //           );
  //         }
  //         final track = snapshot.data!;
  //         return Scaffold(
  //           appBar: AppBar(
  //             actions: [BookmarkButton(track.isBookmarked!, track.trackId)],
  //           ),
  //           body: SingleChildScrollView(
  //               child: Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 Text(
  //                   track.trackName,
  //                   style: const TextStyle(
  //                       fontSize: 22, fontWeight: FontWeight.bold),
  //                 ),
  //                 const SizedBox(
  //                   height: 5,
  //                 ),
  //                 Text(
  //                   track.artistName,
  //                   style: const TextStyle(color: Colors.black54),
  //                 ),
  //                 const SizedBox(
  //                   height: 35,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(8),
  //                   child: Text(
  //                     "Track Details",
  //                     style: TextStyle(
  //                         color: Colors.grey.shade700,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 18),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   // height: 500,
  //                   width: double.infinity,
  //                   child: Card(
  //                     elevation: 3,
  //                     color: Colors.white38,
  //                     // ignore: prefer_const_constructors
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius:
  //                             const BorderRadius.all(Radius.circular(20))),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(32.0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text.rich(TextSpan(children: [
  //                             // ignore: prefer_const_constructors
  //                             TextSpan(
  //                                 text: "ID: ",
  //                                 style: const TextStyle(
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold)),
  //                             TextSpan(
  //                                 text: track.trackId,
  //                                 style: const TextStyle(
  //                                   fontSize: 17,
  //                                 ))
  //                           ])),
  //                           Text.rich(TextSpan(children: [
  //                             // ignore: prefer_const_constructors
  //                             TextSpan(
  //                                 text: "Name: ",
  //                                 style: const TextStyle(
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold)),
  //                             TextSpan(
  //                                 text: track.trackName,
  //                                 style: const TextStyle(
  //                                   fontSize: 17,
  //                                 )),
  //                           ])),
  //                           Text.rich(TextSpan(children: [
  //                             // ignore: prefer_const_constructors
  //                             TextSpan(
  //                                 text: "Translation list: ",
  //                                 style: const TextStyle(
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold)),
  //                             TextSpan(
  //                                 text: track.translationList.toString(),
  //                                 style: const TextStyle(
  //                                   fontSize: 17,
  //                                 )),
  //                           ])),
  //                           Text.rich(TextSpan(children: [
  //                             // ignore: prefer_const_constructors
  //                             TextSpan(
  //                                 text: "Rating: ",
  //                                 style: const TextStyle(
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold)),
  //                             TextSpan(
  //                                 text: track.rating.toString(),
  //                                 style: const TextStyle(
  //                                   fontSize: 17,
  //                                 )),
  //                           ])),
  //                           Text.rich(TextSpan(children: [
  //                             // ignore: prefer_const_constructors
  //                             TextSpan(
  //                                 text: "Subtitles: ",
  //                                 style: const TextStyle(
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold)),
  //                             TextSpan(
  //                                 text: track.hasSubtitles ? "Yes" : "No",
  //                                 style: const TextStyle(
  //                                   fontSize: 17,
  //                                 )),
  //                           ])),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(8),
  //                   child: Text(
  //                     "Track Lyrics",
  //                     style: TextStyle(
  //                         color: Colors.grey.shade700,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 18),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   // height: 500,
  //                   width: double.infinity,
  //                   child: Card(
  //                     elevation: 3,
  //                     color: Colors.white38,
  //                     // ignore: prefer_const_constructors
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius:
  //                             const BorderRadius.all(Radius.circular(20))),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(32.0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(track.lyrics!),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(8),
  //                   child: Text(
  //                     "Album Details",
  //                     style: TextStyle(
  //                         color: Colors.grey.shade700,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 18),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   // height: 500,
  //                   width: double.infinity,
  //                   child: Card(
  //                     elevation: 3,
  //                     color: Colors.white38,
  //                     // ignore: prefer_const_constructors
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius:
  //                             const BorderRadius.all(Radius.circular(20))),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(32.0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text.rich(TextSpan(children: [
  //                             // ignore: prefer_const_constructors
  //                             TextSpan(
  //                                 text: "ID: ",
  //                                 style: const TextStyle(
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold)),
  //                             TextSpan(
  //                                 text: track.albumId,
  //                                 style: const TextStyle(
  //                                   fontSize: 17,
  //                                 ))
  //                           ])),
  //                           Text.rich(TextSpan(children: [
  //                             // ignore: prefer_const_constructors
  //                             TextSpan(
  //                                 text: "Name: ",
  //                                 style: const TextStyle(
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold)),
  //                             TextSpan(
  //                                 text: track.albumName,
  //                                 style: const TextStyle(
  //                                   fontSize: 17,
  //                                 ))
  //                           ])),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.all(8),
  //                   child: Text(
  //                     "Artist Details",
  //                     style: TextStyle(
  //                         color: Colors.grey.shade700,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 18),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   // height: 500,
  //                   width: double.infinity,
  //                   child: Card(
  //                     elevation: 3,
  //                     color: Colors.white38,
  //                     // ignore: prefer_const_constructors
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius:
  //                             const BorderRadius.all(Radius.circular(20))),
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(32.0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text.rich(TextSpan(children: [
  //                             // ignore: prefer_const_constructors
  //                             TextSpan(
  //                                 text: "ID: ",
  //                                 style: const TextStyle(
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold)),
  //                             TextSpan(
  //                                 text: track.artistId,
  //                                 style: const TextStyle(
  //                                   fontSize: 17,
  //                                 ))
  //                           ])),
  //                           Text.rich(TextSpan(children: [
  //                             // ignore: prefer_const_constructors
  //                             TextSpan(
  //                                 text: "Name: ",
  //                                 style: const TextStyle(
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.bold)),
  //                             TextSpan(
  //                                 text: track.artistName,
  //                                 style: const TextStyle(
  //                                   fontSize: 17,
  //                                 ))
  //                           ])),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )),
  //         );
  //       });
  // }
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) => TrackBloc()..add(LoadTrack(id)),
      child: BlocBuilder<TrackBloc, TrackState>(
        builder: (context, state) {
          if (state is NetworkFailure) {
            return const Text("No Internet Connection");
          }
          if (state is TrackInitial) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is TrackLoaded) {
            final track = state.track;
            return Scaffold(
              appBar: AppBar(
                actions: [BookmarkButton(track.isBookmarked!, track.trackId)],
              ),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      track.trackName,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      track.artistName,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(TextSpan(children: [
                                // ignore: prefer_const_constructors
                                TextSpan(
                                    text: "ID: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: track.trackId,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ))
                              ])),
                              Text.rich(TextSpan(children: [
                                // ignore: prefer_const_constructors
                                TextSpan(
                                    text: "Name: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: track.trackName,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    )),
                              ])),
                              Text.rich(TextSpan(children: [
                                // ignore: prefer_const_constructors
                                TextSpan(
                                    text: "Translation list: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: track.translationList.toString(),
                                    style: const TextStyle(
                                      fontSize: 17,
                                    )),
                              ])),
                              Text.rich(TextSpan(children: [
                                // ignore: prefer_const_constructors
                                TextSpan(
                                    text: "Rating: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: track.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 17,
                                    )),
                              ])),
                              Text.rich(TextSpan(children: [
                                // ignore: prefer_const_constructors
                                TextSpan(
                                    text: "Subtitles: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: track.hasSubtitles ? "Yes" : "No",
                                    style: const TextStyle(
                                      fontSize: 17,
                                    )),
                              ])),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(track.lyrics!),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(TextSpan(children: [
                                // ignore: prefer_const_constructors
                                TextSpan(
                                    text: "ID: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: track.albumId,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ))
                              ])),
                              Text.rich(TextSpan(children: [
                                // ignore: prefer_const_constructors
                                TextSpan(
                                    text: "Name: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: track.albumName,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ))
                              ])),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(TextSpan(children: [
                                // ignore: prefer_const_constructors
                                TextSpan(
                                    text: "ID: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: track.artistId,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ))
                              ])),
                              Text.rich(TextSpan(children: [
                                // ignore: prefer_const_constructors
                                TextSpan(
                                    text: "Name: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: track.artistName,
                                    style: const TextStyle(
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
          }
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: Text("Track not found!")),
          );
        },
      ),
    );
  }
}
