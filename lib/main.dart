import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/pages/home_page.dart';
import 'package:weather_app/src/services/api/metaweather_api.dart';
import 'package:weather_app/src/services/api/weather_api_service.dart';
import 'package:weather_app/src/theme/app_theme.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => MetaWeatherApi(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: HomePage(),
      ),
    );
  }
}