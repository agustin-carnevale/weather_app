import 'package:flutter/material.dart';
import 'package:weather_app/src/models/weather.dart';

class City {
  final int id;
  final String title;
  final List<Weather> weathers;

  City({
    this.id,
    this.title,
    this.weathers,
  });

  Map<String, dynamic> toJson() => {
        "woeid": id,
        "title": title,
        "weathers": weathers ==null ? null : weathers.map((e) => e.toJson()).toList(),
      };

  factory City.fromJson(Map<String, dynamic> map) {
    if(map == null){
      return null;
    }
    //Do not allow cities without title or id
    if(map['woeid'] == null || map['title']==null){
      return null;
    }

    final myWeathers = map['weathers'];
    return City(
      id: map['woeid'],
      title: map['title'],
      weathers: myWeathers != null
          ? (myWeathers as List).map((e) => Weather.fromJson(e)).toList()
          : null,
    );
  }

  City fromWeathers(List<Weather> weathers) {
    return City(
      id: id,
      title: title,
      weathers: weathers,
    );
  }

  @override
  int get hashCode => hashValues(id, title, weathers);

  @override
  bool operator ==(other){ 
    if(identical(this, other)) return true;
    if(runtimeType != other.runtimeType)return false;
    final City otherCity = other;
    return id == otherCity.id &&
    title == otherCity.title;
    //TODO: add weathers equality
  }

  @override
  String toString()=> 'id: $id, title: $title, weathers: $weathers';
}