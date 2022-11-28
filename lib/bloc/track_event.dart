part of 'track_bloc.dart';

abstract class TrackEvent extends Equatable {
  const TrackEvent();

  @override
  List<Object> get props => [];
}

class LoadTracks extends TrackEvent {}

class LoadBookmarkedTracks extends TrackEvent {}

class LoadTrack extends TrackEvent {
  final String trackId;
  LoadTrack(this.trackId);
}

class NetworkObserve extends TrackEvent {}

class NetworkNotify extends TrackEvent {
  final bool isConnected;

  const NetworkNotify({this.isConnected = false});
}
