import 'dart:convert';
import 'package:flutter/material.dart';

Weather weatherFromJson(String str) => Weather.fromJson(
      json.decode(str),
    );

String weatherToJson(Weather data) => json.encode(
      data.toJson(),
    );

class Weather {
  Weather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  int id;
  String weatherStateName;
  String weatherStateAbbr;
  String windDirectionCompass;
  DateTime created;
  DateTime applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;
  double windSpeed;
  double windDirection;
  double airPressure;
  num humidity;
  double visibility;
  int predictability;

  factory Weather.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return Weather(
      id: json["id"],
      weatherStateName: json["weather_state_name"],
      weatherStateAbbr: json["weather_state_abbr"],
      windDirectionCompass: json["wind_direction_compass"],
      created: DateTime.parse(json["created"]),
      applicableDate: DateTime.parse(json["applicable_date"]),
      minTemp: json["min_temp"].toDouble(),
      maxTemp: json["max_temp"].toDouble(),
      theTemp: json["the_temp"].toDouble(),
      windSpeed: json["wind_speed"].toDouble(),
      windDirection: json["wind_direction"].toDouble(),
      airPressure: json["air_pressure"],
      humidity: json["humidity"],
      visibility: json["visibility"].toDouble(),
      predictability: json["predictability"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created.toIso8601String(),
        "applicable_date":
            "${applicableDate.year.toString().padLeft(4, '0')}-${applicableDate.month.toString().padLeft(2, '0')}-${applicableDate.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
      };

  @override
  int get hashCode => hashValues(
      id,
      weatherStateName,
      weatherStateAbbr,
      windDirectionCompass,
      created,
      applicableDate,
      minTemp,
      maxTemp,
      theTemp,
      windSpeed,
      windDirection,
      airPressure,
      humidity,
      visibility,
      predictability);

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final Weather otherWeather = other;
    return id == otherWeather.id &&
        weatherStateName == otherWeather.weatherStateName &&
        weatherStateAbbr == otherWeather.weatherStateAbbr &&
        windDirectionCompass == otherWeather.windDirectionCompass &&
        created == otherWeather.created &&
        applicableDate == otherWeather.applicableDate &&
        minTemp == otherWeather.minTemp &&
        maxTemp == otherWeather.maxTemp &&
        theTemp == otherWeather.theTemp &&
        windSpeed == otherWeather.windSpeed &&
        windDirection == otherWeather.windDirection &&
        airPressure == otherWeather.airPressure &&
        humidity == otherWeather.humidity &&
        visibility == otherWeather.visibility &&
        predictability == otherWeather.predictability;
  }

  @override
  String toString() =>
      'id: $id,\n weatherStateName: $weatherStateName,\n weatherStateAbbr: $weatherStateAbbr,\n windDirectionCompass: $windDirectionCompass,\n created: $created,\n applicableDate: $applicableDate,\n minTemp: $minTemp,\n maxTemp: $maxTemp,\n theTemp: $theTemp,\n windSpeed: $windSpeed,\n windDirection: $windDirection,\n airPressure: $airPressure,\n humidity: $humidity,\n visibility: $visibility,\n predictability: $predictability';
}
