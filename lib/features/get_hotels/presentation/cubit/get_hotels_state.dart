part of 'get_hotels_cubit.dart';

abstract class GetHotelsState extends Equatable {
  const GetHotelsState();

  @override
  List<Object> get props => [];
}

class GethotelsInitial extends GetHotelsState {}

class GethotelsLoading extends GetHotelsState {}

class GethotelsLoaded extends GetHotelsState {
  final GetHotelsEntity data;
  const GethotelsLoaded(this.data);
}

class GethotelsFaiulre extends GetHotelsState {}

class GethotelsPagLoading extends GetHotelsState {}

class GethotelsPagLoaded extends GetHotelsState {}

class GethotelsPagFaiulre extends GetHotelsState {}

class ToggleIsEndState extends GetHotelsState {}
