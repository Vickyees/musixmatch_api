import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch_api/bloc/track_bloc.dart';
import 'package:musixmatch_api/screens/track_detail_screen.dart';

class TracksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrackBloc()..add(LoadTracks()),
      child: BlocBuilder<TrackBloc, TrackState>(
        builder: (context, state) {
          if (state is NetworkFailure) {
            return const Text("No Internet Connection");
          }
          if (state is TrackInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TracksLoaded) {
            final trackList = state.tracks;
            return ListView.builder(
              itemCount: trackList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(TrackDetailScreen.routeName,
                        arguments: trackList[index].trackId);
                  },
                  child: ListTile(
                    title: Text(trackList[index].trackName),
                    subtitle: Text(trackList[index].artistName),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
