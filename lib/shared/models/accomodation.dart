// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Accomodation {
  final String id;
  final String imageUrl;
  final String title;
  final String shortDescription;
  final String longDescription;
  final String location;
  final String postalCode;
  final int price;
  final int categorization;
  final int capacity;
  final String accommodationType;
  final bool freeCancelation;
  Accomodation({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.shortDescription,
    required this.longDescription,
    required this.location,
    required this.postalCode,
    required this.price,
    required this.categorization,
    required this.capacity,
    required this.accommodationType,
    required this.freeCancelation,
  });

  Accomodation copyWith({
    String? id,
    String? imageUrl,
    String? title,
    String? shortDescription,
    String? longDescription,
    String? location,
    String? postalCode,
    int? price,
    int? categorization,
    int? capacity,
    String? accommodationType,
    bool? freeCancelation,
  }) {
    return Accomodation(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      location: location ?? this.location,
      postalCode: postalCode ?? this.postalCode,
      price: price ?? this.price,
      categorization: categorization ?? this.categorization,
      capacity: capacity ?? this.capacity,
      accommodationType: accommodationType ?? this.accommodationType,
      freeCancelation: freeCancelation ?? this.freeCancelation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'shortDescription': shortDescription,
      'longDescription': longDescription,
      'location': location,
      'postalCode': postalCode,
      'price': price,
      'categorization': categorization,
      'capacity': capacity,
      'accommodationType': accommodationType,
      'freeCancelation': freeCancelation,
    };
  }

  factory Accomodation.fromMap(Map<String, dynamic> map) {
    return Accomodation(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      shortDescription: map['shortDescription'] as String,
      longDescription: map['longDescription'] as String,
      location: map['location'] as String,
      postalCode: map['postalCode'] as String,
      price: map['price'] as int,
      categorization: map['categorization'] as int,
      capacity: map['capacity'] as int,
      accommodationType: map['accommodationType'] as String,
      freeCancelation: map['freeCancelation'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Accomodation.fromJson(Map<String, dynamic> source) =>
      Accomodation.fromMap(source);

  @override
  String toString() {
    return 'Accomodation(id: $id, imageUrl: $imageUrl, title: $title, shortDescription: $shortDescription, longDescription: $longDescription, location: $location, postalCode: $postalCode, price: $price, categorization: $categorization, capacity: $capacity, accommodationType: $accommodationType, freeCancelation: $freeCancelation)';
  }

  @override
  bool operator ==(covariant Accomodation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.shortDescription == shortDescription &&
        other.longDescription == longDescription &&
        other.location == location &&
        other.postalCode == postalCode &&
        other.price == price &&
        other.categorization == categorization &&
        other.capacity == capacity &&
        other.accommodationType == accommodationType &&
        other.freeCancelation == freeCancelation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrl.hashCode ^
        title.hashCode ^
        shortDescription.hashCode ^
        longDescription.hashCode ^
        location.hashCode ^
        postalCode.hashCode ^
        price.hashCode ^
        categorization.hashCode ^
        capacity.hashCode ^
        accommodationType.hashCode ^
        freeCancelation.hashCode;
  }
}
