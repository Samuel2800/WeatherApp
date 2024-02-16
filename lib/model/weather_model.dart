//this class is just the model in which the weather conditions are
//fetched from the JSON file and set as variables

class Weather{
  String? cityName;
  double? temp;
  double? windSpeed;
  int? windDeg;
  int? humidity;
  int? pressure;
  double? realFeel;
  String? skyIcon;
  String? mainDescription;
  int? visibility;

  Weather({
    this.cityName,
    this.temp,
    this.windSpeed,
    this.windDeg,
    this.humidity,
    this.pressure,
    this.realFeel,
    this.skyIcon,
    this.mainDescription,
    this.visibility
  });

  //this is a model to get specific information from the API

  Weather.fromJson(Map<String, dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    windSpeed = json["wind"]["speed"];
    windDeg = json["wind"]["deg"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    realFeel = json["main"]["feels_like"];
    skyIcon = json["weather"][0]["icon"];
    mainDescription = json['weather'][0]['main'];
    visibility = json['visibility'];
  }
}