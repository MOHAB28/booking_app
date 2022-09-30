import 'package:flutter/material.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../domain/entities/get_hotels_entities.dart';
import 'common_card.dart';

class ItemBuilderFotHotel extends StatelessWidget {
  const ItemBuilderFotHotel({
    Key? key,
    required this.hotelData,
    required this.callback,
  }) : super(key: key);

  final VoidCallback callback;
  final HotelDataEntity hotelData;

  @override
  Widget build(BuildContext context) {
    return CommonCard(
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
                    child: hotelData.hotelImages.isNotEmpty
                        ? Image.network(
                            'http://api.mahmoudtaha.com/images/${hotelData.hotelImages[0].image}',
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/hotel_2.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width >= 360 ? 12 : 8,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: AppPadding.p15),
                            child: Text(
                              hotelData.name,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            hotelData.address,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      const SizedBox(width: AppSize.s5),
                                      Text(
                                        hotelData.rate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '\$${hotelData.price}',
                                  textAlign: TextAlign.left,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                  splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  onTap: () {
                    callback();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
