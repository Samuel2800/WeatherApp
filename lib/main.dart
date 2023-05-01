import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

import 'delegates/custom_search_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  CustomSearchDelegate searchDelegate = CustomSearchDelegate();

  Future<void> getData() async{
  data = await client.getCurrentWeather("Berlin");
  }

  @override
  Widget build(BuildContext context) {
    //Creating the UI of the app
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFFf9f9f9),
        appBar: AppBar(
          backgroundColor: Color(0xE6000000),
          elevation: 0.0,
          title: const Text(
            "Weather App",
            style: TextStyle(color: Colors.deepPurple),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.deepPurple,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.deepPurple,
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: searchDelegate,
                );
              },
            )
          ],
        ),
        body: Container(
          padding:  EdgeInsets.fromLTRB(0, 120, 0, 33),
          decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/clouds.jpg'),
                fit: BoxFit.cover,
              )
          ),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                //custom widget
                currentWeather(Icons.wb_cloudy_outlined, "${data!.temp!.round()}°", "${data!.cityName}"),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                    "Additional Information",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xdd212121),
                      fontWeight: FontWeight.bold,)
                ),
                const Divider(),
                const SizedBox(
                  height: 20.0,
                ),
                // Additional information about the weather
                additionalInformation("${data!.wind}", "${data!.humidity}", "${data!.pressure}", "${data!.realFeel!.round()}°")
              ]);
            }
            return Container();
          }
        ),
        ),
    );
  }
}
