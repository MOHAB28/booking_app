import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/get_hotels_entities.dart';
import '../../domain/usecases/get_hotels_usecase.dart';
part 'get_hotels_state.dart';

class GetHotelsCubit extends Cubit<GetHotelsState> {
  final GetHotelsUsecase _getHotelsUsecase;

  GetHotelsCubit(this._getHotelsUsecase) : super(GethotelsInitial());

  static GetHotelsCubit get(BuildContext context) => BlocProvider.of(context);

  GetHotelsEntity? hotelsEntity;

  Future<void> getHotels(int page) async {
    emit(GethotelsLoading());
    final successOrFailure = await _getHotelsUsecase(page);
    successOrFailure.fold(
      (failure) => emit(GethotelsFaiulre()),
      (data) {
        hotelsEntity = data;
        emit(GethotelsLoaded(data));
      },
    );
  }

  List<HotelDataEntity> hotels = [];
  int lastPage = 1;
  int total = 0;
  int currentPage = 1;
  Future<void> getHotelsPag({
    bool isForce = false,
  }) async {
    emit(GethotelsPagLoading());
    if (isForce) {
      hotels = [];
      currentPage = 1;
    }
    final successOrFailure = await _getHotelsUsecase(currentPage);
    successOrFailure.fold(
      (failure) => emit(GethotelsPagFaiulre()),
      (data) {
        hotels.addAll(data.getAllHotelsData.getHotelData);
        currentPage++;
        if (lastPage == 1) {
          lastPage = data.getAllHotelsData.lastPage;
          total = data.getAllHotelsData.total;
        }
        isEnd = false;
        emit(GethotelsPagLoaded());
      },
    );
  }

  bool isEnd = false;

  void toggleIsEnd() {
    isEnd = !isEnd;

    emit(ToggleIsEndState());
  }
}
