import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle: true,
      ),
      
      body: GoogleMap(
        mapType: MapType.normal,   // satellite / hybrid / terrain ও হতে পারে
          trafficEnabled: true,    // true দিলে map এর উপর real-time traffic দেখাবে (road jam etc)
          zoomGesturesEnabled: true,   // user দুই আঙুল দিয়ে zoom in/out করতে পারবে
          zoomControlsEnabled: true,   // + / - zoom button দেখাবে map এর উপর
          myLocationEnabled: true,     // user এর current location blue dot আকারে দেখাবে
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
              target: LatLng(23.737546522880393, 90.43873055941758),  // শুরুতে map কোন জায়গায় focus করবে. এখানে latitude + longitude দেওয়া
              zoom: 16
          ),


        // map load হওয়া শেষ হলে এই function call হয়
        // controller পাওয়া যায়
        // _mapController এ রেখে দেই যেন পরে camera move,
        // marker add ইত্যাদি করা যায়
        onMapCreated: (GoogleMapController controller){
          _mapController = controller;
        },

        // user map এ single tap করলে এই callback trigger হয়
        onTap: (LatLng latLng){
          print(latLng);
        },

        // user map এ long press করলে run হবে. সেই location print করবে
        onLongPress: (LatLng latLng){
          print('Long Pressed: $latLng');
        },

        // Set<Marker> দিতে হয় (একাধিক marker রাখার জন্য)
        markers: <Marker> {
          Marker(              // নতুন marker তৈরি শুরু
            markerId: MarkerId('home'),         // marker এর unique ID. প্রতিটা marker এর আলাদা ID লাগেই
            position: LatLng(23.737546522880393, 90.43873055941758),  // marker কোন জায়গায় বসবে. latitude + longitude
            onTap: (){
              print("Marker Tapped");
            },
            visible: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
            infoWindow: InfoWindow(
              title: 'Home',
              onTap: (){},
            ),
          ),
          Marker(
            markerId: MarkerId('office'),
            position: LatLng(23.737886658993194, 90.43552033603191),
            onTap: (){
              print("Marker Tapped");
            },
            visible: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: InfoWindow(
              title: 'Office',
              onTap: (){},
            ),
          ),
          Marker(
            markerId: MarkerId('office2'),
            position: LatLng(23.740228979855946, 90.43763492256403),
            onTap: (){
              print("Marker Tapped");
            },
            visible: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(
              title: 'Second Office',
              onTap: (){},
            ),
          ),
        },

        polylines: <Polyline> {     // Set<Polyline> দিতে হয়
          Polyline(       // নতুন polyline তৈরি শুরু
            polylineId: PolylineId('home-to-office'),
            points: [         // line কোন কোন point দিয়ে যাবে. এখানে LatLng list দিতে হয়
              LatLng(23.737546522880393, 90.43873055941758),
              LatLng(23.737886658993194, 90.43552033603191),
              LatLng(23.740228979855946, 90.43763492256403)
            ],
            visible: true,
            color: Colors.redAccent,
            width: 5,
            endCap: Cap.roundCap,   // line এর শুরু + শেষ গোল থাকবে
            startCap: Cap.roundCap,
            geodesic: true,         // earth curve অনুযায়ী line draw করবে
            jointType: JointType.round  // point গুলোর মাঝে join গোল হবে
          ),
          Polyline(
            polylineId: PolylineId('second-office-to-home'),
            points: [
              LatLng(23.740228979855946, 90.43763492256403),
              LatLng(23.737546522880393, 90.43873055941758)
            ],
            visible: true,
            color: Colors.green,
            width: 5,
            endCap: Cap.roundCap,
            startCap: Cap.roundCap,
            geodesic: true,
          ),

        },

        // এখানে Set<Circle> দিতে হয়. একাধিক circle রাখা যায়
        circles: <Circle>{
          Circle(
            circleId: CircleId('home-circle'),
            center: LatLng(23.737546522880393, 90.43873055941758), // circle এর মাঝখানের point. এখান থেকেই radius হিসাব হবে
            radius: 200,  // circle এর size. unit = meter
            strokeColor: Colors.red,
            strokeWidth: 2,
            fillColor: Colors.red.withAlpha(100),
            onTap: (){
              print('On tapped home zone');
            },
            consumeTapEvents: true,  // true দিলে tap event circle নিজেই handle করবে
          ),
        },

        polygons: <Polygon>{
          Polygon(
            polygonId: PolygonId('random-polygon'),
            points: [
              LatLng(23.73625695336238, 90.43552871793509),
              LatLng(23.73340261755206, 90.43489772826433),
              LatLng(23.74185710129517, 90.43502412736416),
              LatLng(23.736399668511638, 90.43546199798584),
              LatLng(23.73860175879572, 90.43650135397911),
              LatLng(23.73738485914887, 90.4330413043499)
            ],
            fillColor: Colors.green.withAlpha(50),
            strokeColor: Colors.green,
            strokeWidth: 2,
            onTap: (){
              print('Polygon tapped');
            },
            consumeTapEvents: true,
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
                target: LatLng(23.737546522880393, 90.43873055941758),
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



  @override
  void dispose() {
    // TODO: implement dispose
    _mapController.dispose();
    super.dispose();
  }


}
