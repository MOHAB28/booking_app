import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../get_hotels/presentation/pages/widgets/common_card.dart';
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
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                              controller: _pageController,
                              itemCount: hotelsEntity
                                  .getAllHotelsData.getHotelData.length,
                              itemBuilder: (context, i) {
                                return CommonCard(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: AspectRatio(
                                      aspectRatio: 2.7,
                                      child: Stack(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              AspectRatio(
                                                  aspectRatio: 0.86,
                                                  child: hotelsEntity
                                                          .getAllHotelsData
                                                          .getHotelData[i]
                                                          .hotelImages
                                                          .isNotEmpty
                                                      ? Image.network(
                                                          'http://api.mahmoudtaha.com/images/${hotelsEntity.getAllHotelsData.getHotelData[i].hotelImages[0].image}',
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Image.asset(
                                                          'assets/images/hotel_2.png',
                                                          fit: BoxFit.cover,
                                                        )),
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                      MediaQuery.of(context)
                                                                  .size
                                                                  .width >=
                                                              360
                                                          ? 12
                                                          : 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        hotelsEntity
                                                            .getAllHotelsData
                                                            .getHotelData[i]
                                                            .name,
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        FontAwesomeIcons
                                                                            .mapMarkerAlt,
                                                                        size:
                                                                            12,
                                                                        color: Theme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                                      Text(
                                                                        hotelsEntity
                                                                            .getAllHotelsData
                                                                            .getHotelData[i]
                                                                            .address,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  RatingBarIndicator(
                                                                    rating: double.tryParse(hotelsEntity
                                                                            .getAllHotelsData
                                                                            .getHotelData[i]
                                                                            .rate)!
                                                                        .toDouble(),
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            const Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .teal,
                                                                    ),
                                                                    itemCount:
                                                                        5,
                                                                    unratedColor:
                                                                        Colors
                                                                            .grey,
                                                                    itemSize:
                                                                        18.0,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            FittedBox(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            8),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "\$${hotelsEntity.getAllHotelsData.getHotelData[i].price}",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              22),
                                                                    ),
                                                                    const Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 2.0),
                                                                      child:
                                                                          Text(
                                                                        ("Per Night"),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.1),
                                              onTap: () {
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
                                                    hotelsEntity
                                                        .getAllHotelsData
                                                        .getHotelData[i]
                                                        .name);
                                                _markers = {};
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
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
