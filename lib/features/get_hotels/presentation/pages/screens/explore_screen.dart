import 'package:flutter/material.dart';
import '../../../../../core/resources/routes.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../login/presentation/widgets/custom_text_field.dart';
import '../../../domain/entities/get_hotels_entities.dart';
import '../../cubit/get_hotels_cubit.dart';
import '../widgets/bottom_top_move_animation.dart';
import '../widgets/popular_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/slider_design.dart';
import '../widgets/title_view.dart';
import '../widgets/view_hotel_button.dart';
import 'hotels_list_view_page.dart';

class ExploreScreen extends StatefulWidget {
  final AnimationController animationController;

  const ExploreScreen({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  late ScrollController controller;
  late AnimationController animationController;
  var sliderImageHeight = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 0),
    );
    widget.animationController.forward();
    controller = ScrollController(initialScrollOffset: 0.0);
    controller.addListener(() {
      if (mounted) {
        if (controller.offset < 0) {
          animationController.animateTo(0.0);
        } else if (controller.offset > 0.0 &&
            controller.offset < sliderImageHeight) {
          if (controller.offset < (sliderImageHeight / 1.5)) {
            animationController
                .animateTo((controller.offset / sliderImageHeight));
          }
        } else {
          animationController
              .animateTo((controller.offset / sliderImageHeight));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sliderImageHeight = MediaQuery.of(context).size.width * 1.3;
    return BlocConsumer<GetHotelsCubit, GetHotelsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (BlocProvider.of<GetHotelsCubit>(context).hotelsEntity != null) {
          return BottomTopMoveAnimationView(
            animationController: widget.animationController,
            child: Stack(
              children: [
                Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: ListView.builder(
                    controller: controller,
                    itemCount: 4,
                    padding: EdgeInsets.only(
                        top: sliderImageHeight + 32, bottom: 16),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var count = 4;
                      var animation = Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: widget.animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      if (index == 0) {
                        return TitleView(
                          titleTxt: (AppStrings.popularDistination.tr()),
                          subTxt: '',
                          animation: animation,
                          animationController: widget.animationController,
                          click: () {},
                        );
                      } else if (index == 1) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),

                          //Popular Destinations animation view SECTION

                          child: PopularListView(
                            animationController: widget.animationController,
                            callBack: (index) {},
                          ),
                        );
                      } else if (index == 2) {
                        return TitleView(
                          titleTxt: AppStrings.bestDeals.tr(),
                          subTxt: AppStrings.viewAll.tr(),
                          animation: animation,
                          isLeftButton: true,
                          animationController: widget.animationController,
                          click: () => Navigator.pushNamed(context, Routes.viewAllHotelsPageKey),
                        );
                      } else {
                        // BEST DEAL SECTION
                        var bloc = BlocProvider.of<GetHotelsCubit>(context)
                            .hotelsEntity!
                            .getAllHotelsData
                            .getHotelData;
                        return getDealListView(bloc, index);
                      }
                    },
                  ),
                ),
                SliderDesign(
                  animationController: animationController,
                ),
                ViewHotelsButton(animationController: animationController),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: 0,
                  right: 0,
                  child:  CustomTextFormField(
                    keyboardType: TextInputType.none,
                    errorText: '',
                    padding: const EdgeInsets.all(AppPadding.p20),
                    showIcon: true,
                    hintText: AppStrings.whereAreyouGoing.tr(),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget getDealListView(List<HotelDataEntity> hotelData, int index) {
    var hotelList = hotelData;

    List<Widget> list = [];
    if (hotelList.isNotEmpty) {
      for (var f in hotelList) {
        var animation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn),
          ),
        );

        list.add(
          HotelListViewPage(
            callback: () {
              const Scaffold();
            },
            hotelData: f,
            animation: animation,
            animationController: widget.animationController,
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: list,
      ),
    );
  }
}
