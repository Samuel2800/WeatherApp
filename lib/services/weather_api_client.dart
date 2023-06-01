import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';



class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location, String? units) async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location permissions denied');
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error('Location Permissions are permanently denied');
    }
    var endpoint;
    var response;
    if(location == "current"){
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );

      var latitude = position.latitude;
      var longitude = position.longitude;
      endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=c623484b44d3372717ddafde6d0e88bf&units=$units");
      response = await http.get(endpoint);
      print(latitude);
      print(longitude);
    }
    else{
      //we use the endpoint and the response to connect to the API on the web
      endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c623484b44d3372717ddafde6d0e88bf&units=$units");
      response = await http.get(endpoint);
    }

      //we then use a json decoder to transform the information into string
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);
  }
}