import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/8_location/domain/location_repo.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/model/location.dart';

part 'location_state.dart';

class LocationBloc extends Cubit<LocationState> {
  LocationBloc() : super(LocationLoadingState());

  Future<void> fetchLocation() async {
    final dataState = await LocationRepo.getLocations();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(LocationLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(LocationErrorState("Error Fetching Data"));
    }
  }
}
