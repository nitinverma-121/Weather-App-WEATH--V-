import 'dart:convert';
import 'package:news_app/Weather%20forecast/model/weather_forecast_model.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatheForecastModel> getData({String cityname}) async {
    final response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityname&mode=json&appid=4e24621fdd890a6735cff9e5d116b206"));
    if (response.statusCode != 200) {
      throw Exception("Unable to show forecast");
    } else {
      var jsonData = json.decode(response.body);
     
      var mappedjsonData = WeatheForecastModel.fromJson(jsonData);

      return mappedjsonData;
    }
  }
}
