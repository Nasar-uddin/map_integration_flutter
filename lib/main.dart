import 'package:flutter/material.dart';
import 'package:flutter_map/screens/home_screen.dart';

void main() {
  runApp(FlutterMap());
}

class FlutterMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
