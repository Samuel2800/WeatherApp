import 'package:flutter/material.dart';

//this class shows the current weather information
//will be modified with the proper containers once
//the figma design is finished

Widget currentWeather(String icon, String temp, String location, String description){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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


        const SizedBox(height: 10),

        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/Icons/$icon.png')),
              const SizedBox(width: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),


      ]
    ),
  );
}