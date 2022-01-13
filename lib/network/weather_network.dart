import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/util/weather_util.dart';

class Network {
  Future<WeatherModel> getWeather({required String cityName}) async {
    var finalUrl =
        "https://samples.openweathermap.org/data/2.5/forecast/daily?q=$cityName&appid=${Util.appId}";

    final response = await get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      print("weather data : ${response.body}");
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}
