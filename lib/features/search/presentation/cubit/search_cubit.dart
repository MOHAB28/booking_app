import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/search_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUsecase searchUsecase;
  SearchCubit(
    this.searchUsecase,
  ) : super(SearchInitial());

  static SearchCubit get(BuildContext context,{bool listen = true}) => BlocProvider.of(context,listen: listen);


}
