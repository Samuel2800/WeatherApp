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
        const SizedBox(
          height: 50.0,
        ),
        Text(
          location,
          style: const TextStyle(
            fontSize: 64.0,
            fontFamily: 'Schyler',
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),

        Text(
          temp,
          style: const TextStyle(
            fontSize: 64.0,
            fontFamily: 'Schyler',
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),


        Image(image: AssetImage('assets/Icons/$icon.png')),


      ]
    ),
  );
}