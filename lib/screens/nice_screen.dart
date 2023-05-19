import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:weather_app/widgets/navigation_drawer_widget.dart';


class NiceScreen extends StatefulWidget{
  const NiceScreen({Key? key}) : super(key: key);

  @override
  State<NiceScreen> createState() => _NiceScreenState();
}

class _NiceScreenState extends State<NiceScreen> {

  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  //the controller keeps track of what the user is typing
  final TextEditingController _searchController = TextEditingController();
  bool _showClearButton = false;


  var location = "Berlin";
  var units = "metric";
  var unitSymbol = "C";
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
                      unitSymbol = "C";
                    }
                    else {
                      units = "imperial";
                      unitSymbol = "F";
                    }
                  });
                  getData();
                },
              )
            ]
        ),

        body: Stack(
          children: [
            Image.asset(
                'assets/Background/rain.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Container(
                  width: 350,
                  height: 715,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        return Column(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            currentWeather("${data!.skyIcon}", "${data!.temp!.round()} °$unitSymbol", "${data!.cityName}"),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
  
}