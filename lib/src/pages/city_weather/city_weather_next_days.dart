import 'package:flutter/material.dart';
import 'package:weather_app/src/models/city.dart';
import 'package:weather_app/src/models/weather.dart';
import 'package:weather_app/src/utils/date_formatter.dart';

const server = 'https://www.metaweather.com/';

class WeatherNextDays extends StatelessWidget {
  WeatherNextDays({Key key, this.city}) : super(key: key);
  final City city;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Next ${city.weathers.length} Days',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _DaysList(city: city),
          ],
        ),
      ),
    );
  }
}

class _DaysList extends StatelessWidget {
  _DaysList({
    Key key,
    @required this.city,
  }) : super(key: key);
  final City city;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: city.weathers.length,
        itemBuilder: (context, index) {
          final weather = city.weathers[index];
          return _DayWeatherItem(weather: weather);
        },
      ),
    );
  }
}

class _DayWeatherItem extends StatelessWidget {
  _DayWeatherItem({Key key, @required this.weather,}) : super(key: key);
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Column(
          children: [
            _CardHeader(weather: weather),
            _LabelsRow(),
            const SizedBox(
              height: 15,
            ),
            _ValuesRow(weather: weather),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  _CardHeader({Key key, @required this.weather,}) : super(key: key);
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Text(
            DateFormatter.day(
              weather.applicableDate,
            ),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0),
            child: Image.network(
              '${server}static/img/weather/png/64/${weather.weatherStateAbbr}.png',
              height: 25,
            ),
          ),
          Spacer(),
          Text(
            '${weather.theTemp.toInt().toString()}°C',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

class _LabelsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Wind Speed',
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            'Air Pressure',
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            'Humidity',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _ValuesRow extends StatelessWidget {
  _ValuesRow({Key key,@required this.weather,}) : super(key: key);
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '${weather.windSpeed.toStringAsFixed(2)} mph',
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            '${weather.airPressure} mbar',
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            '${weather.humidity}%',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
