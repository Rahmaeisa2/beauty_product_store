import '../entity/location_entity.dart';
import '../repository/location_repo.dart';

class GetCurrentLocation {
  final LocationRepository repository;

  GetCurrentLocation(this.repository);

  Future<UserLocation> call() {
    return repository.getCurrentLocation();
  }
}
