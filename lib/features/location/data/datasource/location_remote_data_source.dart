import 'package:beauty_product_store/features/location/domain/entity/location_entity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationRemoteDataSource {
Future<UserLocation> getCurrentLocation()async{
  print('DATASOURCE: entered');

  final serviceEnabled =
  await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    throw Exception('LOCATION_SERVICE_DISABLED');
  }
  var permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.denied) {
    throw Exception('LOCATION_PERMISSION_DENIED');
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('LOCATION_PERMISSION_DENIED_FOREVER');
  }
  final position = await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      timeLimit: Duration(seconds: 15),
    ),
  );
  var address =
      '${position.latitude}, ${position.longitude}';


  final placemarks = await Geocoding().placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );


  if (placemarks.isNotEmpty) {
    final place = placemarks.first;
    address = place.subLocality ??
        place.locality ??
        place.administrativeArea ??
        'Unknown location';
  }

  return UserLocation(
    address: address,
    lat: position.latitude,
    long: position.longitude,
  );

}

}
