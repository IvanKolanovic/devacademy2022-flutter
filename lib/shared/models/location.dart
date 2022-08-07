// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Location {
  final String id;
  final String locationName;
  final String postalCode;
  final String imageUrl;
  final int properties;
  Location({
    required this.id,
    required this.locationName,
    required this.postalCode,
    required this.imageUrl,
    required this.properties,
  });

  Location copyWith({
    String? id,
    String? locationName,
    String? postalCode,
    String? imageUrl,
    int? properties,
  }) {
    return Location(
      id: id ?? this.id,
      locationName: locationName ?? this.locationName,
      postalCode: postalCode ?? this.postalCode,
      imageUrl: imageUrl ?? this.imageUrl,
      properties: properties ?? this.properties,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'locationName': locationName,
      'postalCode': postalCode,
      'imageUrl': imageUrl,
      'properties': properties,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id'] as String,
      locationName: map['locationName'] as String,
      postalCode: map['postalCode'] as String,
      imageUrl: map['imageUrl'] as String,
      properties: map['properties'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(Map<String, dynamic> source) =>
      Location.fromMap(source);

  @override
  String toString() {
    return 'Location(id: $id, locationName: $locationName, postalCode: $postalCode, imageUrl: $imageUrl, properties: $properties)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.locationName == locationName &&
        other.postalCode == postalCode &&
        other.imageUrl == imageUrl &&
        other.properties == properties;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        locationName.hashCode ^
        postalCode.hashCode ^
        imageUrl.hashCode ^
        properties.hashCode;
  }
}
