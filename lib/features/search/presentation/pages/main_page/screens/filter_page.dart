import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../cubit/search_cubit.dart';
import '../../../widgets/search_item_builder.dart';

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
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text(AppStrings.filter),
                        SizedBox(width: AppSize.s5),
                        Icon(Icons.menu),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s10),
              if (widget.title.text.isEmpty) ...[
                const Center(
                  child: Text(AppStrings.enterHotelName),
                ),
              ] else if (widget.title.text.isNotEmpty) ...[
                if (state is SearchLoading) ...[
                  const Center(
                    child: Text(AppStrings.loading),
                  ),
                ] else if (state is SearchLoaded) ...[
                  if (hotelsEntity != null) ...[
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount:
                          hotelsEntity.getAllHotelsData.getHotelData.length,
                      physics: const NeverScrollableScrollPhysics(),
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
                  ] else ...[
                    const Center(
                      child: Text(AppStrings.loading),
                    ),
                  ]
                ] else if (state is SearchFailure) ...[
                  const Center(
                    child: Text(AppStrings.somethingWrong),
                  ),
                ]
              ] else ...[
                const Center(
                  child: Text(AppStrings.somethingWrong),
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}