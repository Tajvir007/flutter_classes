import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({super.key});

  @override
  State<MyLocationScreen> createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen> {

  // 7. location
  Position? _currentLocation;
  // 5.1. continuous location
  StreamSubscription? _locationSubscriber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Location"),
        centerTitle: true,
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My Location: $_currentLocation",
            textAlign: TextAlign.center,
            ),
            FilledButton(onPressed: (){
              _getCurrentLocation();
            },
                child: Text('Get my location')),

            FilledButton(onPressed: (){
              _listenCurrentLocation();
            },
                child: Text('Listen my location')),
          ],
        ),
      ),
      
    );
  }


  // 1. location: Get current location for 1 time
  Future<void> _getCurrentLocation() async {

    // 2. User আগে permission দিয়েছে কিনা চেক
    final LocationPermission locationPermission = await Geolocator.checkPermission();
    if(_isLocationPermissionEnabled(locationPermission)){

      // 4. location: GPS service ON আছে কিনা
      final bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if(isLocationServiceEnabled){

        // 5. location: THEN GET LOCATION
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 0,
            timeLimit: Duration(seconds: 10),
          ),
        );  // GPS ON থাকলে → real location নেওয়া
        print(position);
        _currentLocation = position;
        setState(() {

        });

      }else{
        // 6. location: If not, then ask for permission
        await Geolocator.openLocationSettings();
      }

    }else{
      // 3. location: If not, then ask for permission
      final LocationPermission newLocationPermission = await Geolocator.requestPermission();
      if(_isLocationPermissionEnabled(newLocationPermission)){
        _getCurrentLocation();
      }

    }

  }





  // 1. continuous location: Get current location continuously
  Future<void> _listenCurrentLocation() async {

    // 2. continuous location: User আগে permission দিয়েছে কিনা চেক
    final LocationPermission locationPermission = await Geolocator.checkPermission();
    if(_isLocationPermissionEnabled(locationPermission)){

      // 4. continuous location: location: GPS service ON আছে কিনা
      final bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if(isLocationServiceEnabled){

        // 5. continuous location:: THEN GET LOCATION
        _locationSubscriber = Geolocator.getPositionStream(

          // 8. continuous location:: Set location settings
          locationSettings: LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 0,
            timeLimit: Duration(seconds: 10),
          ),

        ).listen((position){

          print(position);
          _currentLocation = position;
          setState(() {

          });
        });


      }else{
        // 6. continuous location:: If not, then ask for permission
        await Geolocator.openLocationSettings();
      }

    }else{
      // 3. continuous location:: If not, then ask for permission
      final LocationPermission newLocationPermission = await Geolocator.requestPermission();
      if(_isLocationPermissionEnabled(newLocationPermission)){
        _getCurrentLocation();
      }

    }

  }


  // 2.1 location: Check user permission is given
  bool _isLocationPermissionEnabled(LocationPermission locationPermission){
    return locationPermission == LocationPermission.whileInUse || locationPermission == LocationPermission.always;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _locationSubscriber?.cancel();
    super.dispose();
  }

}
