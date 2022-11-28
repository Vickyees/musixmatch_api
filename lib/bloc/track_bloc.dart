import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:musixmatch_api/data/shared_preferences_data.dart';
import 'package:musixmatch_api/data/tracks_data_api.dart';

import '../connection/network_helper.dart';
import '../models/track.dart';

part 'track_event.dart';
part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc() : super(TrackInitial()) {
    on<LoadTracks>((event, emit) async {
      List<Track> tracks = await TracksData.fetchTracks;
      emit(TracksLoaded(tracks));
    });

    on<LoadBookmarkedTracks>((event, emit) async {
      List<Track> tracks = await SharedPreferencesData.bookmarkedTracks;
      emit(BookmarkedTracksLoaded(tracks));
    });

    on<LoadTrack>((event, emit) async {
      Track track = await TracksData.getTrackDetails(event.trackId);
      emit(TrackLoaded(track));
    });

    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }
  static final TrackBloc _instance = TrackBloc();

  // factory TrackBloc() => _instance;

  void _observe(event, emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}
