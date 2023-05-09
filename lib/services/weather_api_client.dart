import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

//this is meant to call the API
//I'm currently waiting for confirmation on the weather forecast

class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location, String? units) async{
      //we use the endpoint and the response to connect to the API on the web
      var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c623484b44d3372717ddafde6d0e88bf&units=$units");
      var response = await http.get(endpoint);
      //we then use a json decoder to transform the information into string
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);
  }
}