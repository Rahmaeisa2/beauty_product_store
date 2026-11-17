import '../entity/location_entity.dart';

abstract class LocationRepository {
  Future<UserLocation> getCurrentLocation();
  Future<String> getAddressFromCoordinates({
    required double lat,
    required double lng,
  });
}


