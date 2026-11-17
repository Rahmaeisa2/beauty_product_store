import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/location_usecase.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetCurrentLocation getCurrentLocation;

  LocationCubit(this.getCurrentLocation)
      : super(LocationInitial());

  Future<void> fetchCurrentLocation() async {
    print('LOCATION 1: Cubit started');

    emit(LocationLoading());

    try {
      print('LOCATION 2: Before UseCase');

      final location = await getCurrentLocation();

      print('LOCATION 3: After UseCase');
      print('Address: ${location.address}');
      print('Lat: ${location.lat}');
      print('Long: ${location.long}');

      if (isClosed) return;

      emit(LocationSuccess(location));

      print('LOCATION 4: Success emitted');
    } catch (e, stackTrace) {
      print('LOCATION ERROR: $e');
      print(stackTrace);

      if (isClosed) return;

      emit(LocationFailure(e.toString()));
    }
  }
}
