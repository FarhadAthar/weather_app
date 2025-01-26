// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Rain {
  double h;
  Rain({
    required this.h,
  });

  Rain copyWith({
    double? h,
  }) {
    return Rain(
      h: h ?? this.h,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '1h': h,
    };
  }

  factory Rain.fromMap(Map<String, dynamic> map) {
    return Rain(
      h: map['1h'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rain.fromJson(String source) => Rain.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Rain(h: $h)';

  @override
  bool operator ==(covariant Rain other) {
    if (identical(this, other)) return true;
  
    return 
      other.h == h;
  }

  @override
  int get hashCode => h.hashCode;
}
