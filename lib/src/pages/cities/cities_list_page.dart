import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/pages/add_city/add_city_page.dart';
import 'package:weather_app/src/pages/cities/cities_list_bloc.dart';
import 'package:weather_app/src/pages/city_weather/city_weather_page.dart';
import 'package:weather_app/src/services/api/weather_api_service.dart';

class CitiesListPage extends StatefulWidget {

  static Widget create(BuildContext context) {
    final ApiService apiService = Provider.of<ApiService>(context,listen:false);
    return ChangeNotifierProvider(
      create: (BuildContext context) => CitiesBloc([], apiService),
      child: CitiesListPage(),
    );
  }

  @override
  _CitiesListPageState createState() => _CitiesListPageState();
}

class _CitiesListPageState extends State<CitiesListPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CitiesBloc>(context);
    return Scaffold(
      appBar: AppBar(
       title: Text("Your Cities"),
       leading: Container(),
      ),
      body: _PageView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_)=>AddCityPage(bloc: bloc)) 
        ),
      ),
   );
  }
}

class _PageView extends StatelessWidget {
  final List<int> colorCodes = <int>[400, 100];

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CitiesBloc>(context);
    return SafeArea(
      child: 
      bloc.cities.isNotEmpty ? 
      ListView.separated(
      padding: const EdgeInsets.only(top:40),
      itemCount: bloc.cities.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index.isEven? 0:1]],
          child: ListTile(
            leading: const Icon(FontAwesomeIcons.globeAmericas, color: Colors.blueGrey,),
            title: Text('${bloc.cities[index].title}'),
            trailing: Icon(Icons.chevron_right,color: Colors.blueGrey),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CityWeatherPage(city: bloc.cities[index])),)
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      ):
      _NoCitiesMessage()
    );
  }
}

class _NoCitiesMessage extends StatelessWidget {
  const _NoCitiesMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: double.infinity,
              child: Container(
                width: double.infinity,
                height: 250,
                child: SvgPicture.asset('assets/svg/add_city.svg'),
              )
            ),
          SizedBox(height: 50,),
          Text(
            'You don\'t have any cities just yet.\n Start by adding a city',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color:Colors.black54 ),
          ),
        ],
      )
    );
  }
}