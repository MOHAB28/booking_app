import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phase3/features/login/presentation/widgets/custom_text_field.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../cubit/search_cubit.dart';
import 'filter_page.dart';
import 'map_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isFilter = true;
  void changeIsFilter() {
    setState(() {
      _isFilter = !_isFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.explore),
            actions: [
              IconButton(
                icon: Icon(_isFilter ? Icons.map : Icons.menu),
                onPressed: () =>
                    changeIsFilter(),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomTextFormField(
                        keyboardType: TextInputType.text,
                        padding: EdgeInsets.zero,
                        controller: _searchController,
                        errorText: '',
                        hintText: AppStrings.hotelName,
                      ),
                    ),
                    const SizedBox(width: AppSize.s8),
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: AppSize.s25,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
                  child: Divider(),
                ),
                if (_isFilter) ...[
                  const FilterPage(),
                ] else ...[
                  const MapPage()
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
