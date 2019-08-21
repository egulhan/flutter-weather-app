import 'package:clima/services/location_helper.dart';
import 'package:clima/services/api.dart';

class WeatherModel {
  LocationHelper location = LocationHelper();

  Future<dynamic> getLocationWeatherData() async {
    await this.location.getCurrentPosition();

    Api api = Api();
    var data = await api.getWeatherDataByPosition(
        lat: this.location.latitude, lon: this.location.longitude);

    return data;
  }

  Future<dynamic> getCityWeatherData(String city) async {
    await this.location.getCurrentPosition();

    Api api = Api();
    var data = await api.getWeatherDataByCity(city);

    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
