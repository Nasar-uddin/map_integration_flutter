import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController mapController;
  static final LatLng _center = LatLng(23.705617, 90.545431);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static final String avaterName = 'Nasar uddin';
  final TextEditingController latLngController = TextEditingController(
      text:
          '${_center.latitude.toString().substring(0, 9)}/${_center.longitude.toString().substring(0, 9)}');
  final TextEditingController avaterNameController =
      TextEditingController(text: '$avaterName');

  @override
  Widget build(BuildContext context) {
    // print(_center.latitude);
    return new Scaffold(
      body: SafeArea(
        child: Container(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 13.15),
            mapType: MapType.terrain,
            buildingsEnabled: true,
            markers: {buildMarker(context)},
          ),
        ),
      ),
    );
  }

  Marker buildMarker(BuildContext context) {
    return Marker(
        markerId: MarkerId('Developer'),
        position: _center,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        onTap: () {
          
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  height: 140,
                  child: Column(
                    children: [
                      TextField(
                        controller: latLngController,
                        decoration: InputDecoration(
                            hintText: 'Lat and lng',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: UnderlineInputBorder()),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: avaterNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Avater',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: UnderlineInputBorder()),
                      )
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('Print'),
                    onPressed: () {
                      print(latLngController.text);
                      print(avaterNameController.text);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            },
          );

        });
  }
}
