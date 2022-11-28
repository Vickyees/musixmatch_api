part of 'track_bloc.dart';

abstract class TrackState extends Equatable {
  const TrackState();

  @override
  List<Object> get props => [];
}

class TrackInitial extends TrackState {}

class TracksLoaded extends TrackState {
  final List<Track> tracks;
  const TracksLoaded(this.tracks);

  @override
  List<Object> get props => [tracks];
}

class BookmarkedTracksLoaded extends TrackState {
  final List<Track> tracks;
  const BookmarkedTracksLoaded(this.tracks);

  @override
  List<Object> get props => [tracks];
}

class TrackLoaded extends TrackState {
  final Track track;
  const TrackLoaded(this.track);
  @override
  List<Object> get props => [track];
}

class NetworkInitial extends TrackState {}

class NetworkSuccess extends TrackState {}

class NetworkFailure extends TrackState {}
