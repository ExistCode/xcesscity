import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:xcesscity/screens/detection_screen.dart';
import 'package:xcesscity/screens/loading_screen.dart';

import '../providers/location_provider.dart';

String mapTheme = '';

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  bool _isLoading = true;
  double _currentLatitude = 0;
  double _currentLongitude = 0;
  Position? position;
  List<Marker> _marker = [];
  Completer<GoogleMapController> _controller = Completer();

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    position = await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    var _provider = Provider.of<LocationProvider>(context, listen: false);
    if (_provider.potholeIdList.isEmpty) {
      _provider.fetchPotholeId().then((_) {
        print('Successfuly fetched ${_provider.potholeIdList.length} ids');
        _provider.fetchAllPotholeReported().then((_) {
          setState(() {
            print("isloading: {$_isLoading}");
            for (int i = 0; i < _provider.potholeIdList.length; i++) {
              _marker.add(_setMarker(
                  "Marker {i}",
                  double.parse(
                    _provider.loadedPotholeReported[i].latitude,
                  ),
                  double.parse(_provider.loadedPotholeReported[i].longitude)));
              print("added ");
            }
            _isLoading = false;
          });
        });
      });
    } else {
      setState(
        () {
          _isLoading = false;
        },
      );
    }
    _determinePosition().then((value) {
      setState(() {
        _currentLatitude = position!.latitude;
        _currentLongitude = position!.longitude;
        _isLoading = false;
      });
    });
    // TODO: implement initState
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString('lib/assets/maptheme/maptheme.json')
        .then((value) {
      mapTheme = value;
    });
  }

  // on below line we have created list of markers

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(3.0636507, 101.615879),
      zoom: 8,
    );
    var _provider = Provider.of<LocationProvider>(context, listen: false);

    return _isLoading
        ? LoadingScreen()
        : GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            markers: _marker.toSet(),
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(mapTheme);
            },
            initialCameraPosition: initialCameraPosition,
          );
  }

  _setMarker(String title, double lat, double long) {
    return Marker(
        markerId: MarkerId(title),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(lat, long));
  }
}
