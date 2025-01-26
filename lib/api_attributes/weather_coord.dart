// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Coord {
  double lat;
  double lon;
  Coord({
    required this.lat,
    required this.lon,
  });

  Coord copyWith({
    double? lat,
    double? lon,
  }) {
    return Coord(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lon': lon,
    };
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) => Coord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coord(lat: $lat, lon: $lon)';

  @override
  bool operator ==(covariant Coord other) {
    if (identical(this, other)) return true;
  
    return 
      other.lat == lat &&
      other.lon == lon;
  }

  @override
  int get hashCode => lat.hashCode ^ lon.hashCode;
}
