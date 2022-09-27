import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/resources/values_manager.dart';
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
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.42796133580664, 122.085749655962);
  late PageController _pageController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
                  height: MediaQuery.of(context).size.height,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
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
                        bottom: 20.0,
                        child: SizedBox(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                              controller: _pageController,
                              itemCount: hotelsEntity
                                  .getAllHotelsData.getHotelData.length,
                              itemBuilder: (context, i) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(hotelsEntity.getAllHotelsData
                                            .getHotelData[i].name),
                                        const SizedBox(width: AppSize.s5),
                                        Text(hotelsEntity.getAllHotelsData
                                            .getHotelData[i].name),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                      // SizedBox(
                      //   height: AppSize.s100,
                      //   child: ListView.separated(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount:
                      //         hotelsEntity.getAllHotelsData.getHotelData.length,
                      //     physics: const BouncingScrollPhysics(),
                      //     itemBuilder: (ctx, i) {
                      //       return Card(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Row(
                      //             children: [
                      //               Text(hotelsEntity
                      //                   .getAllHotelsData.getHotelData[i].name),
                      //               const SizedBox(width: AppSize.s5),
                      //               Text(hotelsEntity
                      //                   .getAllHotelsData.getHotelData[i].name),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //     separatorBuilder: (_, __) {
                      //       return const SizedBox(width: AppSize.s10);
                      //     },
                      //   ),
                      // ),
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
}
