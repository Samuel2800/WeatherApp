import 'package:flutter/material.dart';

//this class shows the current weather information
//will be modified with the proper containers once
//the figma design is finished

Widget currentWeather(String icon, String temp, String location){
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage('lib/icons/${icon}.png')),

        SizedBox(
          height: 10.0,
        ),
        Text(
          "$temp",
          style: TextStyle(
            fontSize: 46.0,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$location",
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF5a5a5a),
          ),
        )
      ]
    ),
  );
}