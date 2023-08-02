import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String mapTheme = '';

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.4226711, -122.0849872),
    zoom: 14,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString('lib/assets/maptheme/maptheme.json')
        .then((value) {
      mapTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      markers: <Marker>{_setMarker()},
      onMapCreated: (GoogleMapController controller) {
        controller.setMapStyle(mapTheme);
      },
      initialCameraPosition: _kGooglePlex,
    );
  }

  _setMarker() {
    return Marker(
        markerId: MarkerId("marker 1"),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(37.4226711, -122.0849872));
  }
}
