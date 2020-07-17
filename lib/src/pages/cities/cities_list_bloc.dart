import 'package:flutter/material.dart';
import 'package:weather_app/src/models/city.dart';
import 'package:weather_app/src/services/api/weather_api_service.dart';

class CitiesBloc extends ChangeNotifier {
  CitiesBloc(this._cities, this._apiService);
  List<City> _cities;
  List<City> _searchResults=[];
  final ApiService _apiService;
  bool loading = false;

  List<City> get cities => _cities;
  List<City> get searchResults => _searchResults;
  ApiService get apiService => _apiService;

  set cities(List<City> cities){
    _cities=cities;
    notifyListeners();
  }

  set searchResults(List<City> results){
    _searchResults = results;
    notifyListeners();
  }

  void requestSearch(String text) async {
    loading = true;
    notifyListeners();
    try {
      _searchResults = await _apiService.getCities(text);
    } catch (e) {
      print('Error while fetching results: $e');
    }
    loading = false;
    notifyListeners();
  }

  void clearSearchResults(){
    _searchResults = [];
    notifyListeners();
  }

  Future<bool> addCity(City city) async {
    bool result;
    loading = true;
    notifyListeners();
    try{
      final newCity = await _apiService.getWeathers(city);
      _cities.add(newCity);
      result= true;
    }catch (e){
      print('Error while fetching weather details: $e');
      result= false;
    }
    loading = false;
    notifyListeners();
    return result;
  }
}
