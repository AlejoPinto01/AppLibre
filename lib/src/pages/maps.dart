// ignore_for_file: unnecessary_new, prefer_collection_literals, use_key_in_widget_constructors, prefer_final_fields, unused_field, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  State<MapsPage> createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  Set<Marker> _markers = HashSet<Marker>();
  late GoogleMapController _mapController; 
  late BitmapDescriptor _markerIcon;
  LatLng onPlace = new LatLng(39.719142, 2.909101);

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/marker.png');
  } 

  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: onPlace,
          infoWindow: InfoWindow(
            title: "Kebab4u",
            snippet: "Restaurante de kebab",
          ),
          icon: _markerIcon
        )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: onPlace,
            zoom: 16,
          ),
          markers: _markers,
          //per a que el mapa fagi lock 
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            new Factory<OneSequenceGestureRecognizer>(
                  () => new EagerGestureRecognizer(),
            ),
          ].toSet(),
        ),
      )
    );
  }
}