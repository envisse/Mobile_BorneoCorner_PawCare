import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_paw_care/const/color_padding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoVet extends StatefulWidget {
  @override
  _GoVetState createState() => _GoVetState();
}

class _GoVetState extends State<GoVet> {
  GoogleMapController mapController;
  LocationService locationService = LocationService();
  Set<Marker> _markers;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    //marker add
    _markers = Set.from([]);
  }

  @override
  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  //for marker
  Future<LatLng> getUserLocation() async {
    LocationData currentLocation;

    final location = Location();

    try {
      currentLocation = await location.getLocation();

      final lat = currentLocation.latitude;

      final lng = currentLocation.longitude;

      final center = LatLng(lat, lng);

      return center;
    } on Exception {
      currentLocation = null;

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: StreamBuilder<UserLocation>(
            stream: locationService.locationstream,
            builder: (context, snapshot) => (snapshot.hasData)
                ? GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          snapshot.data.latitude, snapshot.data.longitude),
                      zoom: 14.0,
                    ),
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    markers: _markers,
                    onTap: (position) {
                      setState(() {
                        _markers.add(
                          Marker(
                            markerId: MarkerId(
                                "${position.latitude}, ${position.longitude}"),
                            icon: BitmapDescriptor.defaultMarker,
                            position: position,
                          ),
                        );
                      });
                    },
                  )
                : Container(
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  ),
          ),
        ),
        SizedBox(
          height: null,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: MarginHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Dimana Anda Sekarang ?',
                  style: TextStyle(fontSize: Content_font_size),
                ),
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

// statement get user location
class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({this.latitude, this.longitude});
}

class LocationService {
  Location location = Location();
  StreamController<UserLocation> _locationstreamcontroller =
      StreamController<UserLocation>();
  Stream<UserLocation> get locationstream => _locationstreamcontroller.stream;

  LocationService() {
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationstreamcontroller.add(UserLocation(
                latitude: locationData.latitude,
                longitude: locationData.longitude));
          }
        });
      }
    });
  }

  void dispose() => _locationstreamcontroller.close();
}
