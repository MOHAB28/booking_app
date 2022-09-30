import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../get_hotels/domain/entities/get_hotels_entities.dart';
import '../../../login/presentation/widgets/custom_button_builder.dart';
import '../../../search/presentation/widgets/search_item_builder.dart';
import '../cubit/booking_cubit.dart';
import '../widgets/custom_sliver_padding.dart';
import '../widgets/delegate.dart';

class HotelDetailsPage extends StatefulWidget {
  final HotelDataEntity hotelsDataEntity;
  const HotelDetailsPage({
    super.key,
    required this.hotelsDataEntity,
  });

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppSize.s0,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: Delegate(
              context,
              widget.hotelsDataEntity,
              _scrollController,
            ),
          ),
          CustomSliverPadding(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppSize.s250,
                      child: Text(
                        widget.hotelsDataEntity.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: AppSize.s4),
                    TextWithIcon(
                      icon: Icons.location_on,
                      text: widget.hotelsDataEntity.address,
                    ),
                    const SizedBox(height: AppSize.s4),
                    TextWithIcon(
                      icon: Icons.star,
                      text: widget.hotelsDataEntity.rate,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${widget.hotelsDataEntity.price}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSize.s4),
                    Text(
                      AppStrings.perNight.tr(),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomSliverPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.summary.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: AppSize.s5),
                Text(
                  widget.hotelsDataEntity.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          CustomSliverPadding(
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p20),
              decoration: BoxDecoration(
                  color: ColorManager.bGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppSize.s15)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.hotelsDataEntity.rate,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorManager.bGreen,
                          ),
                    ),
                    const SizedBox(width: AppSize.s8),
                    Text(
                      AppStrings.overallRating.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.hotelsDataEntity.hotelImages.isNotEmpty)
            CustomSliverPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.photos.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: AppSize.s15),
                  SizedBox(
                    height: AppSize.s70,
                    child: Center(
                      child: ListView.separated(
                        itemCount: widget.hotelsDataEntity.hotelImages.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(AppSize.s15),
                            child: Image(
                              height: AppSize.s70,
                              width: AppSize.s70,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'http://api.mahmoudtaha.com/images/${widget.hotelsDataEntity.hotelImages[i].image}'),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return const SizedBox(width: AppSize.s20);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          BlocConsumer<BookingCubit, BookingState>(
            listener: (context, state) {
              if (state is CreateBookingLoaded) {
                FlushbarHelper.createSuccess(
                  message: state.createBookingEntity.titleEn,
                ).show(context);
              }
            },
            builder: (context, state) {
              return CustomSliverPadding(
                child: state is CreateBookingLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButtonBuilder(
                        onTap: () => BookingCubit.get(context)
                            .createBooking(widget.hotelsDataEntity.id),
                        title: AppStrings.bookNow.tr(),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
