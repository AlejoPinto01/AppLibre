// ignore_for_file: unnecessary_new, prefer_collection_literals, prefer_const_constructors

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MapsPage extends StatefulWidget {
  @override
  State<MapsPage> createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  Set<Marker> _markers = HashSet<Marker>();
  late GoogleMapController _mapController;
  late BitmapDescriptor _markerIcon;
  static const LatLng onPlace = const LatLng(39.719142, 2.909101);
  bool visible = false;

  static const _initialCameraPosition = CameraPosition(
    target: onPlace,
    zoom: 16,
  );

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/marker.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("0"),
          position: onPlace,
          onTap: () {
            setState(() {
              visible = visible = true;
              print(visible);
            });
          },
          infoWindow: InfoWindow(
            title: "Kebab4u",
            snippet: "Restaurante de kebab",
          ),
          icon: _markerIcon));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: false,
        title: Text(
          "Google Maps",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          _crearMapa(),
          _crearInfo(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => _mapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: const Icon(Icons.center_focus_strong),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  _crearMapa() {
    return Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        onTap: (LatLng) {
          setState(() {
            visible = false;
          });
        },
        mapToolbarEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
        //per a que el mapa fagi lock
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
          new Factory<OneSequenceGestureRecognizer>(
            () => new EagerGestureRecognizer(),
          ),
        ].toSet(),
      ),
    );
  }

  _crearInfo() {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: visible,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 35),
          height: 100,
          width: 180,
          child: new FittedBox(
            child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/kebab_restaurant.jpg')
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: detallsRestaurant(),
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

  detallsRestaurant() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              'Kebab4u',
              style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 26.0,
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  "4.1",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                )
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Text(
                  "(946)",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                )
              ),
            ],
          )
        ),
        SizedBox(height: 5.0),
        Container(
          child: Text(
            "Gran Via Colom, 3, 07300 Inca\nIlles Balears",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
            ),
          )
        ),
        SizedBox(height: 5.0),
        Container(
          child: Text(
            "Cerrado \u00B7 Abierto 12:00 - 22:00 \nLunes a viernes.",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ],
    );
  }
}
