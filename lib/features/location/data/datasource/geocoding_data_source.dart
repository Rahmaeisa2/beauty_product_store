import '../../domain/repository/location_repo.dart';

class GetAddressFromCoordinates {
  final LocationRepository repository;

  GetAddressFromCoordinates(this.repository);

  Future<String> call({
    required double lat,
    required double lng,
  }) {
    return repository.getAddressFromCoordinates(
      lat: lat,
      lng: lng,
    );
  }
}