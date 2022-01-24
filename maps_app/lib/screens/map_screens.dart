import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';

class MapScreens extends StatefulWidget {
  //const MapScreens({ Key? key }) : super(key: key);
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreens({
    this.initialLocation = const PlaceLocation(latitude: 37.422, longitude: -122.084,),
    this.isSelecting = false,
  });

  @override
  _MapScreensState createState() => _MapScreensState();
}

class _MapScreensState extends State<MapScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
      ),
      body: ,
    );
  }
}
