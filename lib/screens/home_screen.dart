import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController mapController;
  static final LatLng _center = LatLng(23.705617, 90.545431);
  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    print(_center.latitude);
    return new Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center,zoom: 13.15),
        mapType: MapType.terrain,
        markers: {myPos},
      ),
    );
  }
  Marker myPos = Marker(
    markerId: MarkerId('Md Nasar uddin'),
    position: _center,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    infoWindow: InfoWindow(title: 'Nasar uddin'),
    onTap: (){
      print('Taped');
    }
  );
}
