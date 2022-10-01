import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:phase3/features/facilities/presentation/cubit/facilities_cubit.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../login/presentation/widgets/custom_button_builder.dart';
import '../../../login/presentation/widgets/custom_text_field.dart';
import '../cubit/search_cubit.dart';

class EditFilterPage extends StatefulWidget {
  const EditFilterPage({super.key});

  @override
  State<EditFilterPage> createState() => _EditFilterPageState();
}

class _EditFilterPageState extends State<EditFilterPage> {
  var selectedRange = const RangeValues(0, 0);
  double _currentSliderValue = 0;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? name = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.filter.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSize.s10),
            Text(
              AppStrings.priceForoneNight.tr(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: AppSize.s10),
            RangeSlider(
              values: selectedRange,
              min: 0,
              max: 10000,
              labels: RangeLabels(
                '\$${selectedRange.start.round()}',
                '\$${selectedRange.end.round()}',
              ),
              divisions: 100,
              onChanged: (RangeValues values) => setState(() {
                selectedRange = values;
              }),
            ),
            const SizedBox(height: AppSize.s10),
            const Divider(),
            const SizedBox(height: AppSize.s10),
            CustomTextFormField(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
              keyboardType: TextInputType.text,
              errorText: '',
              controller: _controller,
              hintText: AppStrings.enterUrAddress.tr(),
              titleText: AppStrings.address.tr(),
            ),
            const SizedBox(height: AppSize.s10),
            const Divider(),
            const SizedBox(height: AppSize.s10),
            Text(
              AppStrings.distanceFromCity.tr(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: AppSize.s10),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: 'less than ${_currentSliderValue.round().toString()}km',
              onChanged: (double values) => setState(() {
                _currentSliderValue = values;
              }),
            ),
            const SizedBox(height: AppSize.s10),
            const Divider(),
            const SizedBox(height: AppSize.s10),
            BlocConsumer<FacilitiesCubit, FacilitiesState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit =
                    BlocProvider.of<FacilitiesCubit>(context).facilitiesEntity;
                if (cubit != null) {
                  if (cubit.facilities.isNotEmpty) {
                    return Center(
                      child: Wrap(
                        runSpacing: 16.0,
                        spacing: 16.0,
                        children: [
                          ...cubit.facilities
                              .asMap()
                              .map(
                                (key, value) => MapEntry(
                                  key,
                                  InkWell(
                                    onTap: () {
                                      BlocProvider.of<FacilitiesCubit>(context)
                                          .selectFacility(value.id);
                                    },
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      width: 80.0,
                                      height: 80.0,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: BlocProvider.of<FacilitiesCubit>(
                                                    context)
                                                .selectedFacilities
                                                .any((element) =>
                                                    element == value.id)
                                            ? Colors.teal
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Image.network(value.image),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            value.name,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .values
                              .toList()
                        ],
                      ),
                    );
                  }
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
      bottomSheet: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is SearchLoaded) {
            Navigator.pop(context);
          } else if (state is SearchFailure) {
            FlushbarHelper.createError(message: AppStrings.somethingWrong.tr())
                .show(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p10,
              horizontal: AppPadding.p20,
            ),
            child: state is SearchLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomButtonBuilder(
                    onTap: () => SearchCubit.get(context, listen: false).search(
                      name: name,
                      count: 5,
                      page: 1,
                      address:
                          _controller.text.isNotEmpty ? _controller.text : null,
                      minPrice: selectedRange.start == 0? null : selectedRange.start,
                      maxPrice: selectedRange.end == 0? null : selectedRange.end ,
                      distance: _currentSliderValue == 0? null : _currentSliderValue,
                      facilities: BlocProvider.of<FacilitiesCubit>(context)
                              .selectedFacilities
                              .isNotEmpty
                          ? {
                              ...BlocProvider.of<FacilitiesCubit>(context)
                                  .selectedFacilities
                                  .asMap()
                                  .map(
                                    (key, value) => MapEntry(
                                      'facilities[$key]',
                                      value,
                                    ),
                                  ),
                            }
                          : null,
                    ),
                    title: AppStrings.apply.tr(),
                  ),
          );
        },
      ),
    );
  }
}
