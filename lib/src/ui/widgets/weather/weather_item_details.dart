import 'package:flutter/material.dart';
import 'package:weather_app/src/ui/constants/constants.dart';

class WeatherItemDetails extends StatelessWidget {
  WeatherItemDetails({Key key, this.title, this.value}) : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.white, shadows: shadows),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            shadows: shadows,
          ),
        ),
      ],
    );
  }
}