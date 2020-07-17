import 'package:flutter/material.dart';
import 'package:weather_app/src/models/city.dart';
import 'package:weather_app/src/pages/cities/cities_list_bloc.dart';
import 'package:weather_app/src/utils/debouncer.dart';

class AddCityPage extends StatefulWidget {
  AddCityPage({Key key, this.bloc}) : super(key: key);
  final CitiesBloc bloc;

  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.bloc,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("Add a city"),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          body: _PageView(bloc: widget.bloc),
        );
      },
    );
  }
}

class _PageView extends StatelessWidget {
  _PageView({Key key, @required this.bloc,}) : super(key: key);
  final CitiesBloc bloc;
  final debouncer = Debouncer();

  void handleAddTap(BuildContext context, City city) async {
    final result = await bloc.addCity(city);
    if (result) {
      bloc.clearSearchResults();
      Navigator.of(context).pop();
    }
  }

  void onChangedText(String text) {
    //Debouncer to limit the amount of search requests
    debouncer.run(
      () {
        if (text.isNotEmpty) bloc.requestSearch(text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = bloc.searchResults != null ?  bloc.searchResults: [];
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: TextField(
              key: Key('search-input-key'),
              onChanged: onChangedText,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                filled: true,
                hintText: 'Search city',
                fillColor: Colors.grey[200],
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final city = results[index];
                return ListTile(
                  title: Text(
                    city.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.amber[800],
                    ),
                    onPressed: () {
                      handleAddTap(context, city);
                    },
                  ),
                );
              },
            ),
          ),
          if (bloc.loading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
