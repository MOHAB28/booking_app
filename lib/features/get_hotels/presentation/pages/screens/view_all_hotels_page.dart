import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../search/presentation/widgets/search_item_builder.dart';
import '../../cubit/get_hotels_cubit.dart';

class ViewAllHotelsPage extends StatefulWidget {
  const ViewAllHotelsPage({super.key});

  @override
  State<ViewAllHotelsPage> createState() => _ViewAllHotelsPageState();
}

class _ViewAllHotelsPageState extends State<ViewAllHotelsPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    GetHotelsCubit.get(context).getHotelsPag(
      isForce: true,
    );

    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter == 0 &&
          !GetHotelsCubit.get(context).isEnd &&
          GetHotelsCubit.get(context).lastPage >=
              GetHotelsCubit.get(context).currentPage) {
        debugPrint('maxScrollExtent');
        GetHotelsCubit.get(context).toggleIsEnd();
        GetHotelsCubit.get(context).getHotelsPag();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<GetHotelsCubit, GetHotelsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GetHotelsCubit.get(context);
          return CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    if (cubit.hotels.isNotEmpty) ...[
                      ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(AppPadding.p15),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.hotels.length,
                        separatorBuilder: (_, __) {
                          return const SizedBox(height: AppSize.s20);
                        },
                        itemBuilder: (ctx, i) {
                          return SearchItemBuilder(
                            hotelsDataEntity: cubit.hotels[i],
                          );
                        },
                      ),
                    ],
                    if (cubit.hotels.isEmpty) ...[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                    if (GetHotelsCubit.get(context).isEnd) ...[
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 14.0,
                          bottom: AppPadding.p100,
                        ),
                        child: SizedBox(
                          width: AppSize.s40,
                          height: AppSize.s40,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
