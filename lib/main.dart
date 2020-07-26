import 'package:fluter_locator/services/places_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import "package:provider/provider.dart";

import "./models/place.dart";
import './screens/search_page.dart';
import './services/geolocator_services.dart';
import "./services/places_service.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final placesService = PlacesService();
  final locatorService = GeolocatorService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        ProxyProvider<Position, Future<List<Place>>>(
          update: (context, position, places) {
            return (position != null)
                ? placesService.getPlaces(position.latitude, position.longitude)
                : null;
          },
        )
      ],
      child: MaterialApp(
        title: 'Parking App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Search(),
      ),
    );
  }
}
