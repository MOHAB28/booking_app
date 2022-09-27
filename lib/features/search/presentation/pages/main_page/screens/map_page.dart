import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int markIdCounter = 0;
  var _markers  ;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: ()async{
                goToSearchedPlace(55 , 50);
              },
              child: Container(
                height: screenHeight,
                width: screenWidth,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition:_kGooglePlex ,
                  onMapCreated:(GoogleMapController controller){
                    _controller.complete(controller);

                  } ,
                ),
              ),
            ),
            // Positioned(
            //   top: 140,
            //   left: 10,
            //   right: 10,
            //   bottom: 20,
            //   child: Container(
            //     height: 30,
            //     width: 50,
            //     color: Colors.red,
            //   ),
            // )
          ],
        ),
      ],

    );

  }

  Future <void> goToSearchedPlace(double lat , double lng)async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat , lng) , zoom: 12)
    ));
    setMarker(LatLng(lat, lng));
  }

  void setMarker (point){
    var counter = markIdCounter++;
    final Marker marker = Marker(markerId: MarkerId('marker_$counter'),
    position: point,
    onTap: (){},
    icon: BitmapDescriptor.defaultMarker);
    setState(() {
      _markers.addAll(marker);
    });
  }
}