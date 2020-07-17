import 'package:flutter/material.dart';
import 'package:weather_app/src/pages/cities/cities_list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/img/backgrounds/welcome.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Center(
            child: _PageView(),
          ),
        ),
      ],
    )
   );
  }
}

class _PageView extends StatelessWidget {
  const _PageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 250,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/img/sun.png',
            height: 55,
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            'Welcome',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Would you like to add\n a new city?',
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 50,
          ),
          RaisedButton(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
            child: Text('Start here'),
            onPressed:() => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CitiesListPage.create(context)),)
          ),
        ],
      ),
    );
  }
}

