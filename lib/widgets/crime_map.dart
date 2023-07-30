import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String mapTheme = '';

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final Marker _kGooglePlexMarker = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Incident'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(3.064892920362661, 101.61683399057945));

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
        markers: {
          _kGooglePlexMarker,
        },
        onMapCreated: (GoogleMapController controller) {
          controller.setMapStyle(mapTheme);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(3.064892920362661, 101.61683399057945),
          zoom: 11.0,
        ),
      );
  }
}
