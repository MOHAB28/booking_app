import 'package:another_flushbar/flushbar_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phase3/features/login/presentation/widgets/custom_button_builder.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../get_hotels/domain/entities/get_hotels_entities.dart';
import '../cubit/booking_cubit.dart';

class Delegate extends SliverPersistentHeaderDelegate {
  final BuildContext builldContext;
  final HotelDataEntity hotelsDataEntity;
  final ScrollController scrollController;
  Delegate(this.builldContext, this.hotelsDataEntity, this.scrollController);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    debugPrint('${shrinkOffset / maxExtent}');
    return Stack(
      children: [
        hotelsDataEntity.hotelImages.isNotEmpty
            ? Image(
                height: MediaQuery.of(builldContext).size.height,
                width: MediaQuery.of(builldContext).size.width,
                image: NetworkImage(
                  'http://api.mahmoudtaha.com/images/${hotelsDataEntity.hotelImages[0].image}',
                ),
                fit: BoxFit.cover,
              )
            : const Image(
                image: AssetImage(ImageAssets.wOnbImage),
                fit: BoxFit.cover,
              ),
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint('Hi');
                  Navigator.pop(builldContext);
                },
                child: const CircleAvatar(
                  radius: AppSize.s30,
                  backgroundColor: Colors.black45,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            opacity: (shrinkOffset / maxExtent) > 0.2
                ? 0
                : (1 - (shrinkOffset / maxExtent)),
            duration: const Duration(milliseconds: 200),
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppPadding.p10),
                    margin:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p15),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(AppSize.s15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hotelsDataEntity.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                  const SizedBox(height: AppSize.s4),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: AppSize.s20,
                                        color: ColorManager.bGreen,
                                      ),
                                      const SizedBox(width: AppSize.s4),
                                      SizedBox(
                                        width: AppSize.s150,
                                        child: Text(
                                          hotelsDataEntity.address,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSize.s4),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: AppSize.s20,
                                        color: ColorManager.bGreen,
                                      ),
                                      const SizedBox(width: AppSize.s4),
                                      SizedBox(
                                        width: AppSize.s150,
                                        child: Text(
                                          hotelsDataEntity.rate,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${hotelsDataEntity.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                  const SizedBox(height: AppSize.s4),
                                  Text(
                                    AppStrings.perNight.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s15),
                        BlocConsumer<BookingCubit, BookingState>(
                          listener: (context, state) {
                            if (state is CreateBookingLoaded) {
                              FlushbarHelper.createSuccess(
                                message: state.createBookingEntity.titleEn,
                              ).show(context);
                            }
                          },
                          builder: (context, state) {
                            return state is CreateBookingLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CustomButtonBuilder(
                                    onTap: () => BookingCubit.get(context)
                                        .createBooking(hotelsDataEntity.id),
                                    title: AppStrings.bookNow.tr(),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSize.s20),
                  GestureDetector(
                    onTap: () => scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(AppSize.s10),
                      margin: const EdgeInsets.only(
                        left: AppSize.s100,
                        right: AppSize.s100,
                        bottom: AppSize.s20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(AppSize.s25),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.moreDetails.tr(),
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(width: AppSize.s5),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => MediaQuery.of(builldContext).size.height;

  @override
  double get minExtent => AppSize.s200;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
