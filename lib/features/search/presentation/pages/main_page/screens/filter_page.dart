import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/resources/routes.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../cubit/search_cubit.dart';
import '../../../widgets/search_item_builder.dart';
import 'package:easy_localization/easy_localization.dart';

class FilterPage extends StatefulWidget {
  final TextEditingController title;
  const FilterPage({
    super.key,
    required this.title,
  });

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        var hotelsEntity = SearchCubit.get(context).hotelsEntity;
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.editFilterPageKey,
                        arguments: widget.title.text.isEmpty
                            ? null
                            : widget.title.text,
                      );
                    },
                    child: Row(
                      children: [
                        Text(AppStrings.filter.tr()),
                        const SizedBox(width: AppSize.s5),
                        const Icon(Icons.menu),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s10),
              if (state is SearchLoading) ...[
                Center(
                  child: Text(
                    AppStrings.loading.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ] else if (state is SearchLoaded) ...[
                if (hotelsEntity != null) ...[
                  if (hotelsEntity
                      .getAllHotelsData.getHotelData.isNotEmpty) ...[
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount:
                          hotelsEntity.getAllHotelsData.getHotelData.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (ctx, i) {
                        return SearchItemBuilder(
                          hotelsDataEntity:
                              hotelsEntity.getAllHotelsData.getHotelData[i],
                        );
                      },
                      separatorBuilder: (_, __) {
                        return const SizedBox(height: AppSize.s15);
                      },
                    ),
                  ] else if (hotelsEntity
                      .getAllHotelsData.getHotelData.isEmpty) ...[
                    Center(
                      child: Text(
                        AppStrings.noHotel.tr(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]
                ] else ...[
                  Center(
                    child: Text(AppStrings.loading.tr()),
                  ),
                ],
              ] else if (state is SearchFailure) ...[
                Center(
                  child: Text(
                    AppStrings.somethingWrong.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ]
              // if (widget.title.text.isEmpty) ...[
              //   Center(
              //     child: Text(
              //       AppStrings.enterHotelName.tr(),
              //       style: Theme.of(context).textTheme.bodySmall,
              //     ),
              //   ),
              // ] else if (widget.title.text.isNotEmpty) ...[

              //   ] else if (state is SearchFailure) ...[
              //     Center(
              //       child: Text(
              //         AppStrings.somethingWrong.tr(),
              //         style: Theme.of(context).textTheme.bodySmall,
              //       ),
              //     ),
              //   ]
              // ] else ...[
              //   Center(
              //     child: Text(
              //       AppStrings.enterHotelName.tr(),
              //       style: Theme.of(context).textTheme.bodySmall,
              //     ),
              //   ),
              // ]
            ],
          ),
        );
      },
    );
  }
}
