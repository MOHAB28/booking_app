import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../domain/entities/get_hotels_entities.dart';
import '../widgets/common_card.dart';
import '../widgets/list_cell_animation_view.dart';

class HotelListViewPage extends StatelessWidget {
  final bool isShowDate;
  final VoidCallback callback;
  final HotelDataEntity hotelData;
  final AnimationController animationController;
  final Animation<double> animation;

  const HotelListViewPage(
      {Key? key,
        required this.hotelData,
        required this.animationController,
        required this.animation,
        required this.callback,
        this.isShowDate: false,


      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: CommonCard(
          color: Colors.white,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: AspectRatio(
              aspectRatio: 2.7,
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 0.86,
                        child:hotelData.hotelImages.isNotEmpty ?
                        Image.network(
                          'http://api.mahmoudtaha.com/images/${hotelData.hotelImages[0].image}',
                          fit: BoxFit.cover,
                        ): Image.asset('assets/images/hotel_2.png' , fit: BoxFit.cover,)
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width >= 360
                                  ? 12
                                  : 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                hotelData.name,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style:
                                const TextStyle(
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                hotelData.description,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                FontAwesomeIcons.mapMarkerAlt,
                                                size: 12,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              Text(
                                                hotelData.address ,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                RatingBarIndicator(
                                  rating:double.tryParse(hotelData.rate)!.toDouble() ,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color:Colors.teal,
                                  ),
                                  itemCount: 5,
                                  unratedColor: Colors.grey,
                                  itemSize: 18.0,
                                  direction: Axis.horizontal,
                                ),
                                        ],
                                      ),
                                    ),
                                    FittedBox(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(right: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              "\$${hotelData.price}",
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(fontSize: 22),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 2.0),
                                              child: Text(
                                               ("Per Night"),
                                                style: TextStyle(
                                                  fontSize: 14,
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
                      highlightColor: Colors.transparent,
                      splashColor:
                      Theme.of(context).primaryColor.withOpacity(0.1),
                      onTap: () {
                        try {
                          callback();
                        } catch (e) {}
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}