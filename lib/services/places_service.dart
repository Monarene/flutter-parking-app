import "dart:convert" as convert;

import 'package:fluter_locator/models/place.dart';
import 'package:http/http.dart' as http;

class PlacesService {
  final key = "AIzaSyDiE0okYINOo8BG1O1yDyN1DHPASQgaLiw";

  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http
        .get("https://maps.googleapis.com/maps/api/place/nearbysearch/");
    var json = convert.jsonDecode(response.body);
    var jsonResults = json["results"] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
