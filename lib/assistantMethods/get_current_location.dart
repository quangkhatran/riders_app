import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../global/global.dart';

class UserLocation {
  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      );
      position = newPosition;
      placeMarks = await placemarkFromCoordinates(
          position!.latitude, position!.longitude);
      Placemark pMark = placeMarks![0];
      completeAddress =
          '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea} ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';
    }
  }
}
