import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:weather_app/widgets/navigation_drawer_widget.dart';

//import 'delegates/custom_search_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  //the controller keeps track of what the user is typing
  final TextEditingController _searchController = TextEditingController();
  bool _showClearButton = false;


  var location = "Berlin";
  var units = "metric";
  var selectedUnitIndex = 0;

  //CustomSearchDelegate searchDelegate = CustomSearchDelegate();

  Future<void> getData() async{
    data = await client.getCurrentWeather(location, units);
  }

  void _onTextChanged(String value) {
    setState(() {
      _showClearButton = value.isNotEmpty;
    });
  }

  void _onClear() {
    setState(() {
      _searchController.clear();
      _showClearButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Creating the UI of the app
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFFf9f9f9),
        //this is the sidebar menu
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: const Color(0xE6000000),
          elevation: 0.0,
          title: Stack(
            children: [
              TextField(
                controller: _searchController,
                onChanged: _onTextChanged,
                style : const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  fillColor: const Color(0xE2ffffff),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search City...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: _showClearButton ? null : const Icon(Icons.search),
                  suffixIconColor: Colors.grey,
                ),
                onSubmitted: (String value){
                  setState(() {
                    location = _searchController.text;
                    _onClear();
                  });
                },
              ),
              Visibility(
                visible: _showClearButton,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _onClear,
                ),
              ),
            ],
          ),
          centerTitle: true,
          //leading: IconButton(
          //  onPressed: () {},
          //  icon: const Icon(Icons.menu),
          //  color: Colors.deepPurple,
          //),
          actions: <Widget>[
            ToggleSwitch(
              initialLabelIndex: selectedUnitIndex,
              totalSwitches: 2,
              labels: const ['°C', '°F'],
              onToggle: (index) {
                setState(() {
                  selectedUnitIndex = index!;
                  if (index == 0) {
                    units = "metric";
                  }
                  else {
                    units = "imperial";
                  }
                });
                getData();
             },
            )
          ]
        ),
        body: Container(
          padding:  const EdgeInsets.fromLTRB(0, 120, 0, 33),
          decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/Background/clouds.jpg'),
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
