class Weather{
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;
  double? realFeel;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.pressure,
    this.realFeel
  });

  Weather.fromJson(Map<String, dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    realFeel = json["main"]["feels_like"];
  }
}