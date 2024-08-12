import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/models/guides_model.dart';
import 'package:iamc_flutter/repos/guides_repos.dart';

part 'guides_event.dart';
part 'guides_state.dart';

class GuidesBloc extends Bloc<GuidesEvent, GuidesState> {
  final GuidesRepos repository;

  GuidesBloc({required this.repository}) : super(GuidesInitial()) {
    on<GetGuidesEvent>((event, emit) async {
      emit(GuidesLoading());
      try {
        final newsResponse = await repository.getGuidesRequest();
        emit(GuidesSuccess(guides: newsResponse.guidesList));
      } catch (e) {
        emit(GuidesError(errorText: e.toString()));
      }
    });
  }
}
