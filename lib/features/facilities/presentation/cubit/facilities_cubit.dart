import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phase3/core/usecase/usecase.dart';
import 'package:phase3/features/facilities/domain/entities/facilities_entity.dart';
import '../../domain/usecases/facilities_usecase.dart';
part 'facilities_state.dart';

class FacilitiesCubit extends Cubit<FacilitiesState> {
  final FacilitiesUsecase facilitiesUsecase;
  FacilitiesCubit(this.facilitiesUsecase) : super(FacilitiesInitial());

  FacilitiesEntity? facilitiesEntity;

  void getFacilities() async {
    emit(FacilitiesLoading());

    final response = await facilitiesUsecase(NoParams());

    response.fold(
      (failure) => emit(FacilitiesFailure()),
      (data) {
        facilitiesEntity = data;

        emit(FacilitiesLoaded());
      },
    );
  }

  List<int> selectedFacilities = [];

  void selectFacility(int id) {
    if (selectedFacilities.contains(id)) {
      selectedFacilities.remove(id);
      emit(REMOVESelectFacilityState());
    } else {
      selectedFacilities.add(id);
      emit(ADDSelectFacilityState());
    }

    emit(SelectFacilityState());
  }
}
