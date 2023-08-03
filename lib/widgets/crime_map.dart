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

  @override
  Widget build(BuildContext context) {
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(3.0636507, 101.615879),
      zoom: 14,
    );
    var _provider = Provider.of<LocationProvider>(context, listen: false);
    return _isLoading
        ? LoadingScreen()
        : GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            markers: <Marker>{
              // _setMarker("1st Marker", 3.0836357, 102.6158714),
              // _setMarker("Marker 2", 3.0636507, 101.615879),
              _setMarker(
                  _provider.loadedPotholeReported[0].title,
                  double.parse(_provider.loadedPotholeReported[0].latitude),
                  double.parse(_provider.loadedPotholeReported[0].longitude)),
              _setMarker(
                  _provider.loadedPotholeReported[1].title,
                  double.parse(_provider.loadedPotholeReported[1].latitude),
                  double.parse(_provider.loadedPotholeReported[1].longitude))
            },
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(mapTheme);
            },
            initialCameraPosition: _kGooglePlex,
          );
  }

  _setMarker(String title, double lat, double long) {
    return Marker(
        markerId: MarkerId(title),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(lat, long));
  }
}
