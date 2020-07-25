import 'package:fluter_locator/models/geometry.dart';

class Place {
  final String name;
  final double rating;
  final int userRatingCount;
  final String vicinity;
  final Geometry geometry;

  Place(
      {this.geometry,
      this.name,
      this.rating,
      this.userRatingCount,
      this.vicinity});

  Place.fromJson(Map<dynamic, dynamic> parsedJson)
      : name = parsedJson['name'],
        rating = (parsedJson["rating"] != null)
            ? parsedJson["rating"].toDouble()
            : null,
        vicinity = parsedJson["vicinity"],
        geometry = Geometry.fromJson(parsedJson["geometry"]),
        userRatingCount = (parsedJson["user_rating_total"] != null)
            ? parsedJson["user_rating_total"]
            : null;
}
