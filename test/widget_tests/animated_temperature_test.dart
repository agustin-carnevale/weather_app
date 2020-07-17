import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/models/weather.dart';
import 'package:weather_app/src/ui/widgets/weather/weather_animated_temp.dart';

main(){
  Weather weather;

  setUp((){
    weather = Weather(id: 123, theTemp: 18);
  });

  testWidgets('correct text and value is displayed after animations are done', (WidgetTester tester) async{
    await tester.pumpWidget(
      MaterialApp(home: AnimatedTemperature(weather: weather))
    );
    
    //wait for the widget to build and all animations are done running
    await tester.pumpAndSettle();

    //has many Text widgets
    final text = find.byType(Text);
    expect(text, findsWidgets);

    //has a widget with the text °C
    expect(find.text('°C'),findsOneWidget);

    //has a widget showing theTemp value of weather
    expect(find.text(weather.theTemp.toInt().toString()),findsOneWidget);

  });
}