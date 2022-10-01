import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../get_hotels/domain/entities/get_hotels_entities.dart';
import '../../domain/usecases/search_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUsecase searchUsecase;
  SearchCubit(
    this.searchUsecase,
  ) : super(SearchInitial());

  static SearchCubit get(BuildContext context, {bool listen = true}) =>
      BlocProvider.of(context, listen: listen);

  GetHotelsEntity? hotelsEntity;
  Future<void> search({
    required int count,
    required int page,
    String? name,
    String? address,
    dynamic maxPrice,
    dynamic minPrice,
    Map<String, int>? facilities,
    double? latitude,
    double? longitude,
    dynamic distance,
  }) async {
    emit(SearchLoading());
    final successOrFailure = await searchUsecase(
      SearchUsecaseInput(
        name: name,
        count: count,
        page: page,
        address: address,
        distance: distance,
        latitude: latitude,
        longitude: longitude,
        maxPrice: maxPrice,
        facilities: facilities,
        minPrice: minPrice,
      ),
    );

    successOrFailure.fold(
      (failure) => emit(SearchFailure()),
      (data) {
        hotelsEntity = data;
        emit(SearchLoaded());
      },
    );
  }
}
