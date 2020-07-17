import 'package:flutter/material.dart';
import 'package:weather_app/src/models/weather.dart';
import 'package:weather_app/src/ui/constants/constants.dart';

class AnimatedTemperature extends StatelessWidget {
  AnimatedTemperature({Key key, @required this.weather,}) : super(key: key);
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TweenAnimationBuilder<int>(
            tween: IntTween(
              begin: 0,
              end: weather.theTemp.toInt(),
            ),
            duration: const Duration(
              milliseconds: 800,
            ),
            builder: (context, value, child) {
              return Text(
                value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  shadows: shadows,
                  fontSize: 75,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                '°C',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  shadows: shadows,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}