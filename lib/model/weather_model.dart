//this class is just the model in which the weather conditions are
//fetched from the JSON file and set as variables

class Weather{
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;
  double? realFeel;
  String? skyIcon;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.pressure,
    this.realFeel,
    this.skyIcon
  });

  //this is a model to get specific information from the API

  Weather.fromJson(Map<String, dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    realFeel = json["main"]["feels_like"];
    skyIcon = json["weather"]["icon"];
  }
}