import '../../domain/entity/location_entity.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final UserLocation location;

  LocationSuccess(this.location);
}

class LocationFailure extends LocationState {
  final String message;

  LocationFailure(this.message);
}