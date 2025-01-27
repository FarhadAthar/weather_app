import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_weather_application/api_attributes/clouds.dart';
import 'package:flutter_weather_application/api_attributes/forecast.dart';
import 'package:flutter_weather_application/api_attributes/main_attribute.dart';
import 'package:flutter_weather_application/api_attributes/rain.dart';
import 'package:flutter_weather_application/api_attributes/sys.dart';
import 'package:flutter_weather_application/api_attributes/weather_coord.dart';
import 'package:flutter_weather_application/api_attributes/wind.dart';


class Parent {
  Coord coord;
  List<Forecast> weather;
  String base;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;
  Wind wind;
  MainAttribute main;
  int visibility;
  Rain rain;
  Clouds clouds;
  int dt;
  Parent({
    required this.coord,
    required this.weather,
    required this.base,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
    required this.wind,
    required this.main,
    required this.visibility,
    required this.rain,
    required this.clouds,
    required this.dt,
  });

  Parent copyWith({
    Coord? coord,
    List<Forecast>? weather,
    String? base,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
    Wind? wind,
    MainAttribute? main,
    int? visibility,
    Rain? rain,
    Clouds? clouds,
    int? dt,
  }) {
    return Parent(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
      wind: wind ?? this.wind,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      rain: rain ?? this.rain,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'coord': coord.toMap()});
    result.addAll({'weather': weather.map((x) => x.toMap()).toList()});
    result.addAll({'base': base});
    result.addAll({'sys': sys.toMap()});
    result.addAll({'timezone': timezone});
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'cod': cod});
    result.addAll({'wind': wind.toMap()});
    result.addAll({'main': main.toMap()});
    result.addAll({'visibility': visibility});
    result.addAll({'rain': rain.toMap()});
    result.addAll({'clouds': clouds.toMap()});
    result.addAll({'dt': dt});

    return result;
  }

  // factory Parent.fromMap(Map<String, dynamic> map) {
  //   return Parent(
  //     coord: Coord.fromMap(map['coord']),
  //     weather:
  //         List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
  //     base: map['base'] ?? '',
  //     sys: Sys.fromMap(map['sys']),
  //     timezone: map['timezone']?.toInt() ?? 0,
  //     id: map['id']?.toInt() ?? 0,
  //     name: map['name'] ?? '',
  //     cod: map['cod']?.toInt() ?? 0,
  //     wind: Wind.fromMap(map['wind']),
  //     main: Main.fromMap(map['main']),
  //     visibility: map['visibility']?.toInt() ?? 0,
  //     rain: Rain.fromMap(map['rain']),
  //     clouds: Clouds.fromMap(map['clouds']),
  //     dt: map['dt']?.toInt() ?? 0,
  //   );
  // }
  factory Parent.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      throw Exception("Input map cannot be null");
    }

    return Parent(
      coord: map['coord'] != null
          ? Coord.fromMap(map['coord'])
          : throw Exception("Missing coord"),
      weather: map['weather'] != null
          ? List<Forecast>.from(map['weather']?.map((x) => Forecast.fromMap(x)))
          : [],
      base: map['base'] ?? '',
      sys: map['sys'] != null
          ? Sys.fromMap(map['sys'])
          : throw Exception("Missing sys"),
      timezone: map['timezone']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      cod: map['cod']?.toInt() ?? 0,
      wind: map['wind'] != null
          ? Wind.fromMap(map['wind'])
          : throw Exception("Missing wind"),
      main: map['main'] != null
          ? MainAttribute.fromMap(map['main'])
          : throw Exception("Missing main"),
      visibility: map['visibility']?.toInt() ?? 0,
      rain: map['rain'] != null ? Rain.fromMap(map['rain']) : Rain.empty(),
      clouds: map['clouds'] != null
          ? Clouds.fromMap(map['clouds'])
          : throw Exception("Missing clouds"),
      dt: map['dt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Parent.fromJson(String source) => Parent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Parent(coord: $coord, weather: $weather, base: $base, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod, wind: $wind, main: $main, visibility: $visibility, rain: $rain, clouds: $clouds, dt: $dt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Parent &&
        other.coord == coord &&
        listEquals(other.weather, weather) &&
        other.base == base &&
        other.sys == sys &&
        other.timezone == timezone &&
        other.id == id &&
        other.name == name &&
        other.cod == cod &&
        other.wind == wind &&
        other.main == main &&
        other.visibility == visibility &&
        other.rain == rain &&
        other.clouds == clouds &&
        other.dt == dt;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
        weather.hashCode ^
        base.hashCode ^
        sys.hashCode ^
        timezone.hashCode ^
        id.hashCode ^
        name.hashCode ^
        cod.hashCode ^
        wind.hashCode ^
        main.hashCode ^
        visibility.hashCode ^
        rain.hashCode ^
        clouds.hashCode ^
        dt.hashCode;
  }
}
