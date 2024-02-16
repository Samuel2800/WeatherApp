import 'package:flutter/material.dart';

TextStyle titleFont =
  const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

TextStyle infoFont =
  const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

//this widget was made to show the information about
//wid speed, pressure, humidity and real feel
//thi will get modified according to the fima design

Widget additionalInformation(String wind, String humidity ,String pressure, String realFeel ){


  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wind",
                  style: titleFont,
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                    "Pressure",
                    style: titleFont
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                  style: infoFont,
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                    "$pressure",
                    style: infoFont
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Humidity",
                  style: titleFont,
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                    "Real Feel",
                    style: titleFont
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$humidity",
                  style: infoFont,
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                    "$realFeel",
                    style: infoFont
                )
              ],
            ),
          ],
        ),
      ],
    ),

  );
}