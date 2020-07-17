import 'package:flutter/material.dart';
import 'package:weather_app/src/models/city.dart';
import 'package:weather_app/src/models/weather.dart';
import 'package:weather_app/src/ui/constants/constants.dart';
import 'package:weather_app/src/ui/widgets/weather/weather_animated_temp.dart';
import 'package:weather_app/src/ui/widgets/weather/weather_item_details.dart';
import 'package:weather_app/src/utils/date_formatter.dart';
import './city_weather_next_days.dart';

class CityWeatherPage extends StatelessWidget {
  CityWeatherPage({Key key, this.city}) : super(key: key);
  final City city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        elevation: 3.0,
        title: Text("Weather"),
      ),
      body: Stack(
      fit: StackFit.expand,
      children: [
        //background image
        Positioned.fill(
          child: Image.asset(
            'assets/img/backgrounds/welcome.jpg', 
            fit: BoxFit.cover,
          ),
        ),
        _PageView(
          city: city,
        ),
      ],
      ),
    );
  }
}

class _PageView extends StatelessWidget {
  final City city;

  const _PageView({
    Key key,
    this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Weather weather = city.weathers.first;
    return Stack(
      fit: StackFit.expand,
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                city.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  shadows: shadows,
                ),
              ),
              Text(
                DateFormatter.date(weather.applicableDate),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  shadows: shadows,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              AnimatedTemperature(weather: weather),
              Text(
                weather.weatherStateName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  shadows: shadows,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
        _BottomPageDetails(weather: weather, city: city),
      ],
    );
  }
}

class _BottomPageDetails extends StatelessWidget {
  _BottomPageDetails({Key key,
    @required this.weather,
    @required this.city,
  }) : super(key: key);
  final Weather weather;
  final City city;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Expanded(
                child: WeatherItemDetails(
                  title: 'Wind Speed',
                  value: "${weather.windSpeed.toStringAsFixed(2)} mph",
                ),
              ),
              Expanded(
                child: WeatherItemDetails(
                  title: 'Air Pressure',
                  value: '${weather.airPressure.toStringAsFixed(2)} mbar',
                ),
              ),
              Expanded(
                child: WeatherItemDetails(
                  title: 'Humidity',
                  value: '${weather.humidity}%',
                ),
              ),
            ]),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeatherItemDetails(
                  title: 'Min Temp.',
                  value: weather.minTemp.toStringAsFixed(2),
                ),
                WeatherItemDetails(
                  title: 'Max Temp.',
                  value: weather.maxTemp.toStringAsFixed(2),
                ),
              ],
            ),
            _BottomSheetToggle(city: city),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetToggle extends StatelessWidget {
  const _BottomSheetToggle({
    Key key,
    @required this.city,
  }) : super(key: key);

  final City city;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).showBottomSheet<void>(
              (_) {
                return WeatherNextDays(city: city);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    40.0,
                  ),
                ),
              ),
            );
          },
          icon: Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}


