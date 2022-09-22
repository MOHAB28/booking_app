import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/get_hotels_entities.dart';
import '../../domain/usecases/get_hotels_usecase.dart';

part 'get_hotels_state.dart';

class GetHotelsCubit extends Cubit<GetHotelsState> {
  final GetHotelsUsecase _getHotelsUsecase;

  GetHotelsCubit(this._getHotelsUsecase) : super(GethotelsInitial());

  GetHotelsEntity? hotelsEntity;

  Future<void> getHotels(int page) async {
    emit(GethotelsLoading());
    final successOrFailure = await _getHotelsUsecase(page);
    successOrFailure.fold(
      (failure) => emit(GethotelsFaiulre()),
      (data) => emit(GethotelsLoaded(data)),
    );
  }
}
