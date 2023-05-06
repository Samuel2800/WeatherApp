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
  final TextEditingController _searchController = TextEditingController();

  var location = "Tokyo";

  CustomSearchDelegate searchDelegate = CustomSearchDelegate();

  Future<void> getData() async{
  data = await client.getCurrentWeather(location);
  }

  @override
  Widget build(BuildContext context) {
    //Creating the UI of the app
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFFf9f9f9),
        appBar: AppBar(
          backgroundColor: Color(0xE6000000),
          elevation: 0.0,
          title: TextField(
            controller: _searchController,
            style : const TextStyle(color: Colors.grey),
            decoration: const InputDecoration(
              fillColor: Color(0xE2ffffff),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search City...',
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: Icon(Icons.search),
              suffixIconColor: Colors.grey,
            )
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.deepPurple,
          ),
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
                    currentWeather("${data!.skyIcon}", "${data!.temp!.round()}°", "${data!.cityName}"),
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
      ),
    );
  }
}
