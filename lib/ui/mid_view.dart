import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/util/weather_util.dart';

Widget midView(AsyncSnapshot<WeatherModel> snapshot) {
  var weatherList = snapshot.data?.list;
  var country = snapshot.data?.city?.country;
  var city = snapshot.data?.city?.name;
  var formatDate =
      DateTime.fromMillisecondsSinceEpoch(weatherList![0].dt! * 1000);
  Container midView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            '$city, $country',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          "${Util.getFormatDate(formatDate)}",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Icon(
          FontAwesomeIcons.cloud,
          size: 198,
          color: Colors.pinkAccent,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${weatherList[0].temp?.day?.toStringAsFixed(0)}^F',
                style: TextStyle(
                  fontSize: 34,
                ),
              ),
              Text(
                '${weatherList[0].weather[0].description?.toUpperCase()}',
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${weatherList[0].speed?.toStringAsFixed(1)} mi/h'),
                    Icon(
                      FontAwesomeIcons.wind,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${weatherList[0].humidity?.toStringAsFixed(0)} %'),
                    Icon(
                      FontAwesomeIcons.solidGrinBeamSweat,
                      size: 20,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${weatherList[0].temp?.max} ^F'),
                    Icon(
                      FontAwesomeIcons.temperatureHigh,
                      size: 20,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  return midView;
}
