import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/models/weather.dart';

main(){
  group('From Json', (){
    test('null data', (){
      final Weather weather = Weather.fromJson(null);
      expect(weather, null);
    });

    test('valid random values', (){
      Random random = new Random();
      final randomId = random.nextInt(1000);
      final randomHumidity = random.nextInt(1000);
      final randomPredictability = random.nextInt(1000);
      final randomMinTemp = random.nextDouble()*100;
      final randomMaxTemp = random.nextDouble()*100;
      final randomTheTemp = random.nextDouble()*100;
      final randomWindSpeed = random.nextDouble()*100;
      final randomWindDirection = random.nextDouble()*100;
      final randomAirPressure= random.nextDouble()*100;
      final randomVisibility = random.nextDouble()*100;
      final DateTime now = DateTime.now();

      final Weather weather = Weather.fromJson({
        "id": randomId,
        "weather_state_name": 'weatherStateName',
        "weather_state_abbr": 'weatherStateAbbr',
        "wind_direction_compass": 'windDirectionCompass',
        "created": now.toIso8601String(),
        "applicable_date":
            "${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}",
        "min_temp": randomMinTemp,
        "max_temp": randomMaxTemp,
        "the_temp": randomTheTemp,
        "wind_speed": randomWindSpeed,
        "wind_direction": randomWindDirection,
        "air_pressure": randomAirPressure,
        "humidity": randomHumidity,
        "visibility": randomVisibility,
        "predictability": randomPredictability,
      });
      expect(weather,
        Weather(
          id: randomId, 
          weatherStateName: 'weatherStateName',
          weatherStateAbbr: 'weatherStateAbbr',
          windDirectionCompass: 'windDirectionCompass',
          created: now,
          applicableDate: DateTime.parse('${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}'),
          minTemp:randomMinTemp,
          maxTemp:randomMaxTemp,
          theTemp:randomTheTemp,
          windSpeed:randomWindSpeed,
          windDirection:randomWindDirection,
          airPressure:randomAirPressure,
          humidity: randomHumidity,
          visibility: randomVisibility,
          predictability: randomPredictability)
        );
    });
  });

  group('To Json', (){
    test('valid properties', (){
      final DateTime now = DateTime.now();
      final Weather weather = Weather(
        id: 123, 
        weatherStateName: 'weatherStateName',
        weatherStateAbbr: 'weatherStateAbbr',
        windDirectionCompass: 'windDirectionCompass',
        created: now,
        applicableDate: now,
        minTemp:1.1,
        maxTemp:1.2,
        theTemp:1.3,
        windSpeed:1.4,
        windDirection:1.5,
        airPressure:1.6,
        humidity: 123,
        visibility: 1.0,
        predictability: 123,
      );
      expect(weather.toJson(),{
        "id": 123,
        "weather_state_name": 'weatherStateName',
        "weather_state_abbr": 'weatherStateAbbr',
        "wind_direction_compass": 'windDirectionCompass',
        "created": now.toIso8601String(),
        "applicable_date":
            "${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}",
        "min_temp": 1.1,
        "max_temp": 1.2,
        "the_temp": 1.3,
        "wind_speed": 1.4,
        "wind_direction": 1.5,
        "air_pressure": 1.6,
        "humidity": 123,
        "visibility": 1.0,
        "predictability": 123,
      });
    });

  });

}


