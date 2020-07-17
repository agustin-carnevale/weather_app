import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/models/city.dart';
import 'package:weather_app/src/pages/add_city/add_city_page.dart';
import 'package:weather_app/src/pages/cities/cities_list_bloc.dart';
import 'package:weather_app/src/services/api/weather_api_service.dart';

class MockWeatherAPI extends Mock implements ApiService {}

main(){
  MockWeatherAPI mockWeatherAPI;
  CitiesBloc bloc;

  setUp((){
    mockWeatherAPI = MockWeatherAPI();
    bloc = CitiesBloc([], mockWeatherAPI);
  });

  Future<void> pumpAddCityPage(WidgetTester tester) async{
    await tester.pumpWidget(
      Provider<ApiService>(
        create: (BuildContext context) => mockWeatherAPI,
        child: MaterialApp(
          home: AddCityPage(bloc: bloc,),
        ),
      )
    );
  }

  group('Search',(){
    testWidgets(
            'WHEN the user enters a search term'
            'AND wait for at least a second'
            'THEN requestSearch method'
            'is called with that specific term',
    (WidgetTester tester) async{
      await pumpAddCityPage(tester);
      const searchTerm = 'Buenos Aires';

      final searchTextField = find.byKey(Key('search-input-key'));
      //first check the textfield exists
      expect(searchTextField, findsOneWidget);

      //then enter the search term on the text field and rebuild with pump
      await tester.enterText(searchTextField, searchTerm);
      await tester.pump();

      //wait a this time because of the implemented debouncer
      await tester.pump(new Duration(milliseconds: 1500));

      verify(bloc.requestSearch(searchTerm)).called(1);
    });
  });

  group('Add a city',(){
    testWidgets(
            'WHEN the user already made a search'
            'AND taps on the add button of one city in the results list'
            'THEN addCity method is called'
            'AND the city is added to the cities list of bloc',
    (WidgetTester tester) async{

      await pumpAddCityPage(tester);

      //simulates this city as a result of the search
      //and added to the results list
      City city = City(id: 123, title:'Buenos Aires');
      bloc.searchResults= [city];
      await tester.pump();

      //taps the add button next to the city added (e.g. Buenos Aires)
      final addButton = find.byType(IconButton);
      await tester.tap(addButton);

      //verifies the addCity method was called exactly once 
      //and with the correct city as argument
      verify(bloc.addCity(city)).called(1);
    });
  });
}