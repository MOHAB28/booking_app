import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phase3/features/login/presentation/widgets/custom_text_field.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../cubit/search_cubit.dart';
import 'screens/filter_page.dart';
import 'screens/map_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.explore),
        actions: [
          IconButton(
            icon: Icon(_isFilter ? Icons.map : Icons.menu),
            onPressed: () => changeIsFilter(),
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
                      onPressed: () {
                        if (_searchController.text.isEmpty) {
                          FlushbarHelper.createError(
                            message: AppStrings.enterHotelName,
                          ).show(context);
                        } else {
                          SearchCubit.get(context, listen: false).search(
                            name: _searchController.text.trim(),
                            page: 1,
                            count: 5,
                          );
                        }
                      },
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
              FilterPage(
                title: _searchController,
              ),
            ] else ...[
              const MapPage()
            ]
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
