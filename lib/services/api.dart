import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '1354fd0f67a6630f6d9f8de6ebd6444b';
const apiBaseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class Api {
  Future<dynamic> getWeatherDataByPosition({double lat, double lon}) async {
    String url = '$apiBaseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return {
        'temperature': data['main']['temp'],
        'condition': data['weather'][0]['id'],
        'city': data['name']
      };
    } else {
      return {'temperature': 0, 'condition': 'Error', 'city': ''};
    }
  }

  Future<dynamic> getWeatherDataByCity(String city) async {
    String url = '$apiBaseUrl?q=$city&appid=$apiKey&units=metric';
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return {
        'temperature': data['main']['temp'],
        'condition': data['weather'][0]['id'],
        'city': data['name']
      };
    } else {
      return {'temperature': 0, 'condition': 'Error', 'city': ''};
    }
  }
}
