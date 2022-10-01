import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../get_hotels/presentation/pages/widgets/hotel_item_builder.dart';
import '../../../cubit/search_cubit.dart';

class MapPage extends StatefulWidget {
  final TextEditingController title;
  const MapPage({
    super.key,
    required this.title,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> _markers = Set<Marker>();
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.42796133580664, 122.085749655962);
  late PageController _pageController;
  int markerIdCounter = 1;
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    bearing: 0,
    tilt: 0.0,
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17,
  );

  @override
  void initState() {
    _pageController = PageController(initialPage: 1, viewportFraction: 0.85);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        var hotelsEntity = SearchCubit.get(context).hotelsEntity;
        return Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 200,
                  child: GoogleMap(
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    mapType: MapType.normal,
                    markers: _markers,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    initialCameraPosition: _kGooglePlex,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                  ),
                ),
                if (widget.title.text.isEmpty) ...[
                  const SizedBox(),
                ] else if (widget.title.text.isNotEmpty) ...[
                  if (state is SearchLoading) ...[
                    const SizedBox(),
                  ] else if (state is SearchLoaded) ...[
                    if (hotelsEntity != null) ...[
                      Positioned(
                        bottom: 100.0,
                        child: SizedBox(
                          height: 150.0,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                              controller: _pageController,
                              itemCount: hotelsEntity
                                  .getAllHotelsData.getHotelData.length,
                              itemBuilder: (context, i) {
                                return ItemBuilderFotHotel(
                                  callback: () {
                                    gotoSearchedPlace(
                                      double.tryParse(hotelsEntity
                                              .getAllHotelsData
                                              .getHotelData[i]
                                              .latitude)!
                                          .toDouble(),
                                      double.tryParse(hotelsEntity
                                              .getAllHotelsData
                                              .getHotelData[i]
                                              .longitude)!
                                          .toDouble(),
                                      hotelsEntity.getAllHotelsData
                                          .getHotelData[i].name,
                                    );
                                  },
                                  hotelData: hotelsEntity
                                      .getAllHotelsData.getHotelData[i],
                                );
                              }),
                        ),
                      ),
                    ] else ...[
                      const SizedBox(),
                    ]
                  ] else if (state is SearchFailure) ...[
                    const SizedBox(),
                  ]
                ] else ...[
                  const SizedBox(),
                ]
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> gotoSearchedPlace(double lat, double lng, String title) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));

    _setMarker(LatLng(lat, lng), title);
  }

  void _setMarker(point, String title) {
    var counter = markerIdCounter++;

    final Marker marker = Marker(
      markerId: MarkerId('marker_$counter'),
      position: point,
      infoWindow: InfoWindow(
        title: title,
      ),
      onTap: () {},
      icon: BitmapDescriptor.defaultMarker,
    );

    setState(() {
      _markers.add(marker);
    });
  }
}
