import 'package:location/location.dart';

class LocationHelper {
  double latitude;
  double longitude;

  LocationHelper();

  Future getCurrentPosition() async {
    try {
      LocationData locationData = await Location().getLocation();

      if (locationData != null) {
        this.latitude = locationData.latitude;
        this.longitude = locationData.longitude;
      }
    } catch (e) {
      print(e);
    }
  }
}
