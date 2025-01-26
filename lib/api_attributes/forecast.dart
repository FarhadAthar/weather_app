// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Forecast {
  int id;
  String main;
  String description;
  String icon;
  Forecast({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Forecast copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Forecast(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Forecast.fromMap(Map<String, dynamic> map) {
    return Forecast(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Forecast.fromJson(String source) => Forecast.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Forecast(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(covariant Forecast other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.main == main &&
      other.description == description &&
      other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      main.hashCode ^
      description.hashCode ^
      icon.hashCode;
  }
}
