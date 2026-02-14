import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  // Map control করার জন্য controller
  late final GoogleMapController _mapController;

Position? currentLocation;
StreamSubscription? locationSubscriber;
LatLng? myCurrentLocation;

  // সব previous location store করার list
  List<LatLng> polylinePoints = [];

  // Map এ polyline draw করার জন্য
  Set<Polyline> polylines = {};

  Timer? locationTimer;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle: true,
      ),

      body: GoogleMap(
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        trafficEnabled: true,
        myLocationButtonEnabled: true,

        initialCameraPosition: CameraPosition(
            target: LatLng(
              myCurrentLocation!.latitude,
              myCurrentLocation!.longitude,),  // শুরুতে map কোন জায়গায় focus করবে. এখানে latitude + longitude দেওয়া
            zoom: 16
        ),

        onMapCreated: (GoogleMapController controller){
          _mapController = controller;
        },

        onTap: (LatLng latLng){
          print('Single clicked on map: $latLng');
        },

        markers: myCurrentLocation == null
            ? {}
            : {
          Marker(
            markerId: MarkerId('me'),
            position: myCurrentLocation!,   // 🔥 current location এখানে
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed),

            infoWindow: InfoWindow(
              title: 'Me',
              snippet:
              '${myCurrentLocation!.latitude}, ${myCurrentLocation!.longitude}',
            ),
          ),
        },


        polylines: {
          Polyline(
            polylineId: PolylineId('live_route'),
            points: polylinePoints,     // 🔥 multiple live locations
            width: 5,
            color: Colors.redAccent,
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
            jointType: JointType.round,
            geodesic: true,
          ),
        },



      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: (){
            // LatLng(23.737546522880393, 90.43873055941758),

            _mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(
                    myCurrentLocation!.latitude,
                    myCurrentLocation!.longitude,
                  ),
                  zoom: 16,
                ),
              ),
            );

          },
            child: Icon(Icons.my_location),
          ),
        ],
      ),

    );
  }



  Future<void> getCurrentLocation() async {

    // 2. User আগে permission দিয়েছে কিনা চেক
    final LocationPermission locationPermission = await Geolocator.checkPermission();
    if(isLocationPermissionEnabled(locationPermission)){

      // 4. location: GPS service ON আছে কিনা
      final bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if(isLocationServiceEnabled){

        locationSubscriber = Geolocator.getPositionStream(

          locationSettings: LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 0,
            timeLimit: Duration(seconds: 10),
          ),

        ).listen((position) async {

          print(position);
          print('Every 10sc location:  $position');
          currentLocation = position;
          LatLng newLocation = LatLng(position.latitude, position.longitude);

          setState(() {

            myCurrentLocation = newLocation;

            polylinePoints.add(newLocation);

          });
        });


      }else{
        // 6. location: If not, then ask for permission
        await Geolocator.openLocationSettings();
      }

    }else{
      // 3. location: If not, then ask for permission
      final LocationPermission newLocationPermission = await Geolocator.requestPermission();
      if(isLocationPermissionEnabled(newLocationPermission)){
        getCurrentLocation();
      }

    }

  }



  bool isLocationPermissionEnabled(LocationPermission locationPermission){
    return locationPermission == LocationPermission.whileInUse || locationPermission == LocationPermission.always;
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();

    // 🔥 প্রতি 10 sec পরপর call
    locationTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      getCurrentLocation();
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    locationSubscriber?.cancel();
    _mapController.dispose();
    super.dispose();
  }

}
