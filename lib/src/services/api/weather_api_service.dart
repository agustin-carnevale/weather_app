import 'package:weather_app/src/models/city.dart';

abstract class ApiService {
  Future<List<City>> getCities(String text);
  Future<City> getWeathers(City city);
}
