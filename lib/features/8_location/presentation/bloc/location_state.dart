part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadedState extends LocationState {
  final List<Location> locations;

  LocationLoadedState(this.locations);
}

class LocationErrorState extends LocationState {
  final String error;

  LocationErrorState(this.error);
}
