import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/network/weather_network.dart';
import 'package:weather_app/ui/mid_view.dart';
import 'package:weather_app/util/weather_util.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({Key? key}) : super(key: key);

  @override
  _WeatherMainState createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  late Future<WeatherModel> weatherObject;
  String cityName = "Mumbai";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherObject = getWeather(cityName: cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherModel>(
                future: weatherObject,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<WeatherModel> snapshot,
                ) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        midView(snapshot),
                      ],
                    );
                  } else {
                    return Container(
                        child: Center(child: CircularProgressIndicator()));
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter City Name',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
            cityName = value;
            weatherObject = getWeather(cityName: cityName);
          });
        },
      ),
    );
  }

  Future<WeatherModel> getWeather({required String cityName}) => Network().getWeather(cityName: cityName);
}
