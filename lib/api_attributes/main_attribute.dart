// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class MainAttribute {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  double pressure;
  double humidity;
  double sea_level;
  double grnd_level;
  MainAttribute({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
    required this.sea_level,
    required this.grnd_level,
  });
  

  MainAttribute copyWith({
    double? temp,
    double? feels_like,
    double? temp_min,
    double? temp_max,
    double? pressure,
    double? humidity,
    double? sea_level,
    double? grnd_level,
  }) {
    return MainAttribute(
      temp: temp ?? this.temp,
      feels_like: feels_like ?? this.feels_like,
      temp_min: temp_min ?? this.temp_min,
      temp_max: temp_max ?? this.temp_max,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      sea_level: sea_level ?? this.sea_level,
      grnd_level: grnd_level ?? this.grnd_level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': sea_level,
      'grnd_level': grnd_level,
    };
  }

  factory MainAttribute.fromMap(Map<String, dynamic> map) {
    return MainAttribute(
      temp: map['temp'] as double,
      feels_like: map['feels_like'] as double,
      temp_min: map['temp_min'] as double,
      temp_max: map['temp_max'] as double,
      pressure: map['pressure'] as double,
      humidity: map['humidity'] as double,
      sea_level: map['sea_level'] as double,
      grnd_level: map['grnd_level'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainAttribute.fromJson(String source) => MainAttribute.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainAttribute(temp: $temp, feels_like: $feels_like, temp_min: $temp_min, temp_max: $temp_max, pressure: $pressure, humidity: $humidity, sea_level: $sea_level, grnd_level: $grnd_level)';
  }

  @override
  bool operator ==(covariant MainAttribute other) {
    if (identical(this, other)) return true;
  
    return 
      other.temp == temp &&
      other.feels_like == feels_like &&
      other.temp_min == temp_min &&
      other.temp_max == temp_max &&
      other.pressure == pressure &&
      other.humidity == humidity &&
      other.sea_level == sea_level &&
      other.grnd_level == grnd_level;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
      feels_like.hashCode ^
      temp_min.hashCode ^
      temp_max.hashCode ^
      pressure.hashCode ^
      humidity.hashCode ^
      sea_level.hashCode ^
      grnd_level.hashCode;
  }
}
