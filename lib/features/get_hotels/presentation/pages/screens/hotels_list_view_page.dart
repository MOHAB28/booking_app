import 'package:flutter/cupertino.dart';
import '../../../../booking/presentation/pages/hotel_details.dart';
import '../../../domain/entities/get_hotels_entities.dart';
import '../widgets/hotel_item_builder.dart';
import '../widgets/list_cell_animation_view.dart';

class HotelListViewPage extends StatelessWidget {
  final bool isShowDate;
  final VoidCallback callback;
  final HotelDataEntity hotelData;
  final AnimationController animationController;
  final Animation<double> animation;

  const HotelListViewPage({
    Key? key,
    required this.hotelData,
    required this.animationController,
    required this.animation,
    required this.callback,
    this.isShowDate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCellAnimationView(
      animation: animation,
      animationController: animationController,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: ItemBuilderFotHotel(
          hotelData: hotelData,
          callback: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => HotelDetailsPage(
                  hotelsDataEntity: hotelData,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
