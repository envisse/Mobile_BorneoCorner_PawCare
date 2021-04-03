import 'package:flutter/material.dart';
import 'package:flutter_paw_care/const/color_padding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoVet extends StatefulWidget {
  @override
  _GoVetState createState() => _GoVetState();
}

class _GoVetState extends State<GoVet> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-0.509390, 117.169178);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            zoomControlsEnabled: false,
          ),
        ),
        SizedBox(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: MarginHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('Dimana Anda Sekarang ?',style: TextStyle(fontSize: Content_font_size),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Masukkan Lokasi anda',
                      prefixStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
