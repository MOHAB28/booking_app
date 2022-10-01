part of 'facilities_cubit.dart';

abstract class FacilitiesState extends Equatable {
  const FacilitiesState();

  @override
  List<Object> get props => [];
}

class FacilitiesInitial extends FacilitiesState {}

class FacilitiesLoading extends FacilitiesState {}

class FacilitiesLoaded extends FacilitiesState {}

class FacilitiesFailure extends FacilitiesState {}

class SelectFacilityState extends FacilitiesState {}
class ADDSelectFacilityState extends FacilitiesState {}
class REMOVESelectFacilityState extends FacilitiesState {}
