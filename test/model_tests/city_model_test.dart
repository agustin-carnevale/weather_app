import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/models/city.dart';

main(){
  group('From Json', (){
    test('null data', (){
      final City city = City.fromJson(null);
      expect(city, null);
    });

    test('missing id', (){
      final City city = City.fromJson({
        'title': 'myCity'
      });
     expect(city, null);
    });

    test('missing title', (){
      final City city = City.fromJson({
        'woeid': 123,
      });
     expect(city, null);
    });

    test('with id and title properties', (){
      final City city = City.fromJson({
        'woeid': 123,
        'title': 'myCity'
      });
     expect(city, City(id: 123, title: 'myCity', weathers: null));
    });
  });

  group('To Json', (){
    test('valid id and title, null weathers', (){
      final City city = City(id: 123, title: 'myCity', weathers: null);
      expect(city.toJson(),{
        'woeid': 123,
        'title': 'myCity',
        'weathers': null
      });
    });

  });
}