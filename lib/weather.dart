import 'package:flutter/material.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({Key? key}) : super(key: key);

  @override
  _WeatherMainState createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'),),
    );
  }
}
